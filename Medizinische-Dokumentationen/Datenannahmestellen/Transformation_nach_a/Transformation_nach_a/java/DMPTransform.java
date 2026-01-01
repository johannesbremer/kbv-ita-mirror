/************************************************************************************************
* Funktion:
*
* Version: 1.01
*
* Parameter:	[0] - Inputverzeichnis
* 				[1] - Outputverzeichnis
* 				[2] - Stylesheet-File
* 				[3] - File-Extension
*
* History:
* 01.10.2003	M. Schulz	- created
* 13.06.2008	E. Usorov	- updated
*
* Copyright (C) KBV, 2000-2003
************************************************************************************************/

// Imported TRAX classes
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.stream.StreamSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerConfigurationException;

// Imported java classes
import java.io.*;
import java.util.*;

public class DMPTransform
{
	public static void main(String[] args) throws java.io.IOException, java.net.MalformedURLException,
												  TransformerException, TransformerConfigurationException
	{
		// prüfe auf notwendige Parameter
		if( args.length < 4 )
		{
			System.out.println( "Mindestens ein erforderlicher Parameter fehlt\r\n" );
			System.exit(1);
		}

		TransformerFactory tFactory = TransformerFactory.newInstance();

	   	// Have the TransformerFactory obtain a interface to a
	   	// new Transformer object.
	   	Transformer transformer = tFactory.newTransformer( new StreamSource( args[2] ) );

		File test = new File( args[0] );

		// Kontrollausgaben
		//System.out.println( "parameter 0: " + args[0] );
		//System.out.println( "parameter 1: " + args[1] );
		//System.out.println( "parameter 2: " + args[2] );
		//System.out.println( "parameter 3: " + args[3] );

		String dmpParam = args[3];

		ArrayList errorfiles = new ArrayList();
		FilenameFilterImpl filter = new FilenameFilterImpl();
		filter.setDMP( dmpParam );

		String[] liste = test.list( filter );//list

		int i = 0;

		while( i < liste.length )
		{
			String outfile = "";

			if( dmpParam.equals("ED2") )
			{
				if ( liste[i].endsWith( "ED2" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".ED2")) + "_2a.ED2";
				}
			}
			else if( dmpParam.equals("FD2") )
			{
				if ( liste[i].endsWith( "FD2" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".FD2")) + "_2a.FD2";
				}
			}
			else if( dmpParam.equals("EBK") )
			{
				if ( liste[i].endsWith( "EBK" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EBK")) + "_4a.EBK";
				}
			}
			else if( dmpParam.equals("FBK") )
			{
				if ( liste[i].endsWith( "FBK" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".FBK")) + "_4a.FBK";
				}
			}
			else if( dmpParam.equals("EKHK") )
			{
				if ( liste[i].endsWith( "EKHK" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EKHK")) + "_6a.EKHK";
				}
			}
			else if( dmpParam.equals("FKHK") )
			{
				if ( liste[i].endsWith( "FKHK" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".FKHK")) + "_6a.FKHK";
				}
			}
			else if( dmpParam.equals("ED1") )
			{
				if ( liste[i].endsWith( "ED1" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".ED1")) + "_8a.ED1";
				}
			}
			else if( dmpParam.equals("FD1") )
			{
				if ( liste[i].endsWith( "FD1" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".FD1")) + "_8a.FD1";
				}
			}
			/*  neue eDMPs */
			else if( dmpParam.equals("EED1") )
			{
				if ( liste[i].endsWith( "EED1" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EED1")) + "_a.EED1";
				}
			}
			else if( dmpParam.equals("EVD1") )
			{
				if ( liste[i].endsWith( "EVD1" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EVD1")) + "_a.EVD1";
				}
			}
			else if( dmpParam.equals("EED2") )
			{
				if ( liste[i].endsWith( "EED2" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EED2")) + "_a.EED2";
				}
			}
			else if( dmpParam.equals("EVD2") )
			{
				if ( liste[i].endsWith( "EVD2" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EVD2")) + "_a.EVD2";
				}
			}
			else if( dmpParam.equals("EEAB") )
			{
				if ( liste[i].endsWith( "EEAB" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EEAB")) + "_a.EEAB";
				}
			}
			else if( dmpParam.equals("EVAB") )
			{
				if ( liste[i].endsWith( "EVAB" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EVAB")) + "_a.EVAB";
				}
			}
			else if( dmpParam.equals("EECO") )
			{
				if ( liste[i].endsWith( "EECO" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EECO")) + "_a.EECO";
				}
			}
			else if( dmpParam.equals("EVCO") )
			{
				if ( liste[i].endsWith( "EVCO" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EVCO")) + "_a.EVCO";
				}
			}
			else if( dmpParam.equals("EEKHK") )
			{
				if ( liste[i].endsWith( "EEKHK" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EEKHK")) + "_a.EEKHK";
				}
			}
			else if( dmpParam.equals("EVKHK") )
			{
				if ( liste[i].endsWith( "EVKHK" ) )
				{
					outfile = liste[i].substring(0,liste[i].indexOf(".EVKHK")) + "_a.EVKHK";
				}
			}
			
			
			
			
			else
			{
				System.out.println( "Der dmp-Parameter " + dmpParam + " kann vom System nicht verarbeitet werden!\r\n" );
				System.exit(1);
			}

			try
			{
				transformer.transform( new StreamSource(args[0] + "\\" + liste[i]),
						      		   new StreamResult(new FileOutputStream(args[1] +"\\" + outfile)) );

				System.out.println("bearbeite Datei " + liste[i] + " zu " + outfile);
			}
			catch(TransformerException x)
			{
				System.out.println("bearbeite Datei " + liste[i] + " zu " + outfile + " ist fehlgeschlagen");
				errorfiles.add( liste[i] );
			}

			i++;
		}
		if (!errorfiles.isEmpty())
		{
			FileOutputStream errorlog = new FileOutputStream(args[2]+ "\\errorxml.log");
			String errmsg = "folgende Dateien konnten nicht erfolgreich transformiert werden:\r\n";
			errorlog.write(errmsg.getBytes());
			ListIterator iter = errorfiles.listIterator();
			while(iter.hasNext())
			{
				String errfile = ((String) iter.next()) + "\r\n" ;
				errorlog.write(errfile.getBytes());
			}
			errorlog.close();
			System.exit(2);
		}

	}//main
}//KTTransform


class FilenameFilterImpl implements FilenameFilter
{
	public String dmp = "";

	public boolean accept( File dir,String name )
	{
		if( name.indexOf( '.' ) >= 0 )
		{
			String pattern = name.substring( 0,name.indexOf( '.' ) );

			if ( dmp.equals( "ED2" ) )
			{
				return ( name.endsWith( "ED2" ) );
			}
			else if ( dmp.equals( "FD2" ) )
			{
				return ( name.endsWith( "FD2" ) );
			}
			else if ( dmp.equals( "EBK" ) )
			{
				return ( name.endsWith( "EBK" ) );
			}
			else if ( dmp.equals( "FBK" ) )
			{
				return ( name.endsWith( "FBK" ) );
			}
			else if ( dmp.equals( "EKHK" ) )
			{
				return ( name.endsWith( "EKHK" ) );
			}
			else if ( dmp.equals( "FKHK" ) )
			{
				return ( name.endsWith( "FKHK" ) );
			}
			else if ( dmp.equals( "ED1" ) )
			{
				return ( name.endsWith( "ED1" ) );
			}
			else if ( dmp.equals( "FD1" ) )
			{
				return ( name.endsWith( "FD1" ) );
			}
			/*   neue eDMPS */
			else if ( dmp.equals( "EED1" ) )
			{
				return ( name.endsWith( "EED1" ) );
			}
			else if ( dmp.equals( "EVD1" ) )
			{
				return ( name.endsWith( "EVD1" ) );
			}
			else if ( dmp.equals( "EED2" ) )
			{
				return ( name.endsWith( "EED2" ) );
			}
			else if ( dmp.equals( "EVD2" ) )
			{
				return ( name.endsWith( "EVD2" ) );
			}
			else if ( dmp.equals( "EEAB" ) )
			{
				return ( name.endsWith( "EEAB" ) );
			}
			else if ( dmp.equals( "EVAB" ) )
			{
				return ( name.endsWith( "EVAB" ) );
			}
			else if ( dmp.equals( "EECO" ) )
			{
				return ( name.endsWith( "EECO" ) );
			}
			else if ( dmp.equals( "EVCO" ) )
			{
				return ( name.endsWith( "EVCO" ) );
			}
			else if ( dmp.equals( "EEKHK" ) )
			{
				return ( name.endsWith( "EEKHK" ) );
			}
			else if ( dmp.equals( "EVKHK" ) )
			{
				return ( name.endsWith( "EVKHK" ) );
			}
			
			
			
		}
		return false;
	}

	public void setDMP( String param )
	{
		dmp = param;
	}

}//FilenamefilterImpl
