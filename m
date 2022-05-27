Return-Path: <SRS0=aEoJ=WD=prime-online-leads.com=jessica.taylor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7053C433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 15:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63639C34113; Fri, 27 May 2022 15:09:13 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58371C385A9
	for <soc@kernel.org>; Fri, 27 May 2022 15:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58371C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=prime-online-leads.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=prime-online-leads.com
Received: by mail-pj1-f43.google.com with SMTP id cv10so4827476pjb.4
        for <soc@kernel.org>; Fri, 27 May 2022 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=prime-online-leads.com; s=google;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :thread-index:content-language;
        bh=aJBByyPE/CPvSHHLMVE05VKchdHiv/RfOQqPZJOkeXI=;
        b=mHbZFZ6xq2CnjC2xp22wl0zLjYWKPudLo6Pq2QefgdwnOC0+XtYZkE2SuReBKg5hKo
         ESllBgmZBFhVmhLsZii+nUidNg9b7yg+OXYog9PFUPfdG25fEQpaRYNfvziB7sEbbFfO
         O1npviJ3ESIq2nmK46NVn4sluqg28DbHIL1jQmEhV/qbL4VP9FB+TDKTb57beYKaXeOy
         yUn/TwFwEz3TCtdBf+C4bGoq7MAqKaCbZxigfsif4iLA/KxlxVHr1ag/xSTQtkyb8Da1
         brSoyZCmoZssqu4H2VkevetgjuDnk8tYD8V3SpGfY/uOiClRfOyuuQJ9VMpNdKhyYy2C
         w4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:references:in-reply-to:subject:date
         :message-id:mime-version:thread-index:content-language;
        bh=aJBByyPE/CPvSHHLMVE05VKchdHiv/RfOQqPZJOkeXI=;
        b=YrR07T04NxTP4PLwuX75Vsvy1heKuPBnorhaVSrrtO7x6XYimfNqX9R76RnVDLHjz6
         EMfPvLw9FIWFolvv8I7dQHjtswSN09NS3G2z59UP4UBAG5RHSA4uhrbNa9L20/4Slr8P
         I2q3Q92xLLNg19VWwjApdgt6aCIyGnC8U3ZwQsBN6uYHFK7D7Ut89CCjoNn5wlztqXSf
         8XSVRXu25gks1ouN5FyNTLiTHp3h3FNsEemjq48imFLDH//93hHCSfJrqmHTov9mwISF
         WIzTqCotBrfR8okbh02bUDBaY43MOYuIveW3FaXzd+tPJgoe0vtRN1wbRDJQTuwklL67
         lrNg==
X-Gm-Message-State: AOAM530FXvY9Bj/2WiATW7LNf1jZVcqFTM+ZT5y5QQi/sk+Gd2KgFv0V
	ciE7+wxMF04And6vHxKefVUfsTORiHFKaA==
X-Google-Smtp-Source: ABdhPJxgcaS2k+ciT6SSesqlTjUQyJ5PQsh9uHbiXqYfvvCf6QA8pFaheEdP/pyLdS/QveYxdaHP6Q==
X-Received: by 2002:a17:90b:1809:b0:1df:de43:e56 with SMTP id lw9-20020a17090b180900b001dfde430e56mr8955654pjb.135.1653664151480;
        Fri, 27 May 2022 08:09:11 -0700 (PDT)
Received: from DESKTOP5M7JK9Q ([117.209.51.153])
        by smtp.gmail.com with ESMTPSA id c8-20020a170903234800b001628c0d6c4fsm3834105plh.7.2022.05.27.08.09.09
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 May 2022 08:09:10 -0700 (PDT)
From: "Jessica Taylor" <jessica.taylor@prime-online-leads.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
References: 
In-Reply-To: 
Subject: Synaptics Incorporated-Semiconductor Manufacturing Technology Industry Professionals
Date: Fri, 27 May 2022 11:09:00 -0400
Message-ID: <199701d871db$b8294ac0$287be040$@prime-online-leads.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_1998_01D871BA.31195870"
X-Mailer: Microsoft Outlook 15.0
Thread-Index: Adhx25T+0i/+g7RgRn6sT2QKEvtbaQAAAneg
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_1998_01D871BA.31195870
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

Good day to you,

 

Are you interested to reach the newly updated email list of Semiconductor
Manufacturing Technology Industry Professionals?

 

Below are the list of some of the specialties available in this database:

 

Semiconductors

Motion Sensors

Photo voltaics (PV)
High-Brightness LED
Flat Panel Display (FPD)
Micro-electromechanical systems (MEMS)
Printed and flexible electronics
Related micro- and Nano-electronics
Technology companies
IDMs companies
Foundries
Fabless
Contract Packaging and Test Houses
OEMs
Materials Manufacturers
Components and sub-systems

 

If your target audience is not mentioned above, kindly let me know.

 

Please send me your target audience and geographical area, so that I can
give you more information, Counts, Pricing as well as few samples, just for
your review.

            

            

Target Industry :  _____________          Target Geography :  ______________
Target Job Title :  _________________ 

            

Let me know your interest, so that we could discuss further

 

Note: We will provide Sample List for your preview.

                                    

Best Regards,

 


Jessica Taylor                        

Online Marketing Manager

 

 

Other Industries: -Oil & Gas,  Energy & Utility, Health Care,
Transportation, IT Security, Manufacturing, Finance, Insurance, Food &
Beverage, Hospitality, Construction, Publishing and Printing,
Semiconductors, Security Etc.

 

 

If you do not wish to receive future emails from us, please reply as 'leave
out'


------=_NextPart_000_1998_01D871BA.31195870
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>Hi,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>Good =
day to you,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>Are you =
interested to reach the newly updated email list <b><span =
style=3D'background:yellow;mso-highlight:yellow'>of Semiconductor =
Manufacturing Technology Industry =
Professionals?</span><o:p></o:p></b></span></p><p =
class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'>Below are the list of some of the specialties =
available in this database:<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New =
Roman","serif";color:#00B050'>Semiconductors<o:p></o:p></span></b></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif";color:#00B050'>Motion =
Sensors<o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";color:#00B050'>Photo voltaics (PV)<br>High-Brightness =
LED<br>Flat Panel Display (FPD)<br>Micro-electromechanical systems =
(MEMS)<br>Printed and flexible electronics<br>Related micro- and =
Nano-electronics<br>Technology companies<br>IDMs =
companies<br>Foundries<br>Fabless<br>Contract Packaging and Test =
Houses<br>OEMs<br>Materials Manufacturers<br>Components and =
sub-systems<o:p></o:p></span></b></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'>If your target audience is not mentioned above, =
kindly let me know.<o:p></o:p></span></b></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'><o:p>&nbsp;</o:p></span></b></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'>Please send me your target audience and geographical =
area, so that I can give you more information, Counts, Pricing as well =
as few samples, just for your review.<o:p></o:p></span></b></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New =
Roman","serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";background:yellow;mso-highlight:yellow'>Target Industry =
:&nbsp; =
_____________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Target Geography :&nbsp; =
______________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Target Job =
Title :&nbsp; _________________</span></b><b><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'> =
<o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; <o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>Let me =
know your interest, so that we could discuss =
further<o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'><o:p>&nbsp;</o:p></span></b></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'>Note: We will provide Sample List for your =
preview.<o:p></o:p></span></b></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>Best =
Regards,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>Jessica =
Taylor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:12.0pt;font-family:"Times New Roman","serif"'>Online =
Marketing Manager<o:p></o:p></span></b></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><b><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman","serif"'>Other Industries: -<span style=3D'color:red'>Oil =
&amp; Gas,&nbsp; Energy &amp; Utility, Health Care, Transportation, IT =
Security, Manufacturing, Finance, Insurance, Food &amp; Beverage, =
Hospitality, Construction, Publishing and Printing, Semiconductors, =
Security Etc.<o:p></o:p></span></span></b></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman","serif";color:#7F7F7F;mso-style-textfill-fill-color:#7F7F7F;mso-st=
yle-textfill-fill-alpha:100.0%'>If you do not wish to receive future =
emails from us, please reply as 'leave out'</span><span =
style=3D'color:#7F7F7F;mso-style-textfill-fill-color:#7F7F7F;mso-style-te=
xtfill-fill-alpha:100.0%'><o:p></o:p></span></p></div></body></html>
------=_NextPart_000_1998_01D871BA.31195870--

