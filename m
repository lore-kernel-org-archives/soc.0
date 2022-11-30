Return-Path: <SRS0=R53F=36=muthihi.co.za=delivery-@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F82C4167B
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 00:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4663C43470; Wed, 30 Nov 2022 00:56:38 +0000 (UTC)
Received: from outgoing19.jnb.host-h.net (outgoing19.jnb.host-h.net [129.232.250.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4DBFC43149
	for <soc@kernel.org>; Wed, 30 Nov 2022 00:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4DBFC43149
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=muthihi.co.za
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=muthihi.co.za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=muthihi.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Subject:From:To:Date:reply-to:sender:cc:bcc:
	in-reply-to:references; bh=V5a8R/1ytEuhDvwIcmAZlT7ZeH5uVN5BByCxvH4ey5E=; b=YI
	g+SXq6mOiOdxv6D5m04arah5GOSgCw8ts1UGJ4KTK2TkE8rPeGr3FmMCzg/I0mLLhbiHn9Ke9vQpd
	CzeYkGksfjJ/VkG8iUx3Z72LC1CRYZtwQ+TXf3QuRZNqk02pAjl1C2h4My7ZHF/MEO6j4T+9zgr6a
	1YAvdispcCVnoSscCZCpVvUykBMyGdnQeqpegUOEjG5WhYj0334v8za1/9HdhhEUJ0KYfHtO32RWD
	VAWeVqy9GBrGIeef2mypmvOHzz91SeApFQmKKku2XnaYwnzi2QQTLIF7083RXQXLzLJ54myjw9dyc
	MPCBj1QDhI9rN5ePjekw4pZF1UJMEqZg==;
Received: from dedi701.jnb2.host-h.net ([129.232.138.161])
	by antispam9-jnb1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <delivery-@muthihi.co.za>)
	id 1p0BOo-0004i0-D2
	for soc@kernel.org; Wed, 30 Nov 2022 02:56:32 +0200
Received: from localhost ([127.0.0.1] helo=dedi701.jnb2.host-h.net)
	by dedi701.jnb2.host-h.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <delivery-@muthihi.co.za>)
	id 1p0BOo-0000Wf-8W
	for soc@kernel.org; Wed, 30 Nov 2022 02:56:30 +0200
Received: from muthimhmmj by dedi701.jnb2.host-h.net with local (Exim 4.92)
	(envelope-from <muthimhmmj@dedi701.jnb2.host-h.net>)
	id 1p0BOo-0000Vq-1D
	for soc@kernel.org; Wed, 30 Nov 2022 02:56:30 +0200
Date: Wed, 30 Nov 2022 02:56:15 +0200
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
From: DHL-Post Office <delivery-@muthihi.co.za>
Subject: Your package cannot be delivered
Message-ID: <3a9bb8bcf2067d83da8535d7b022a594@muthihi.co.za>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="1a7dac3dbbc35e23847f6ca624ff517eb"
Content-Transfer-Encoding: 8bit
X-Hetz-Sender-Domain: muthihi.co.za
X-Originating-IP: 129.232.138.161
X-SpamExperts-Domain: muthihi.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@muthihi.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.57)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9iz5YkS16UG0OkCIPs5ZotPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xAYYQO1K0YQRvfDE7GxvlFfYzfQXcfqmra3dmoHS4ygkNU
 ZnswQPWXTe6boqyIPwZWuRWrkPihq53YqAd1ENNqGJknaRAogWV+EY+Abz+FfISjtzXFm2IXiyU8
 yLQfvRcT60P49ggkaf6aS/g1fYJ1tcZs9avT6P2Ok/RegWo7IqxcIlehpl1U/qj5rbwAzPRvGa4v
 WSARmdN9f2lroiiC3YIorYy1sw9XW0h4kBsi1j6Q7HWhx6hhu2F4Ka7Z+VywCtC/7kzbd1gsONRs
 xm9WavqbvYaNvQlcqdw7fQPXOUNKwnAR2oVisY+bnEqWCKi1Aj7VKjQE180+fqaKKctU6RVbjnLk
 DLt/3ItnD02EfFc6tUXraJVRpRA20+K8mmwpcvZoI7P90p8oLprk3TF7EVBannnL7tRRK/uB8nvA
 5aDHPrzOXHyvGOgslo1eG4TOSL2qqK5bcGTkL6B2Y6JVqp3Ow04hhQJdvb/qAqQPjbNud3PgzKGZ
 88iododq/YfVWMlHoWh7YJ70YBk8N5yx6J1fhOzjF0b4LXcjJZ5loghir8tsA2FmzfElBk7wEu7f
 4aJeniRsy2r3QA5yG5VLUedckiTz1sKpflxXY2iBxix0IlTAygEZcW3fzeQYFC2GbN7BITAZon7Z
 Iz1ONK9yUo4/+EUytKrR9Md9I2Rs1zQDlthie4fygU0sZZWQ88Qj8OKYtwgxhYBPZkMOcbv8m1Kh
 EStPmr2sfn5wdPDzChACTrV59JSfrb0N/nef5NRmMRr+w2X69ygMahiTQMBdzRtTn8vbDVtQGT+A
 PVAyzk81K7Mn3dW7cW+WhJKEMZDDKmaieiq0jxLm7wmwfeg/UDicYio/sxrbfQ/N4MXa1pHbuv0d
 hTPOJMWERUrwtSDlHggAnwOpksx+0CGJnlUGEj6IzqA91xEra75WqKfxsDSD9b6U55wibM/EnPNR
 BJwESKCnEDUJK5+j4v3Uev2q
X-Report-Abuse-To: spam@antispammaster.host-h.net

This is a multi-part message in MIME format.

--1a7dac3dbbc35e23847f6ca624ff517eb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit




	



DHL Express

 

Hi,


 

We inform you that your shipment No 54960131540 is still awaiting instructions from you.

 

You have to pay the additional shipping fees to ship your parcel as soon as possible.

 

As soon as we receive your additional shipping fees we’ll be in touch to arrange delivery.

 

 

 Start Delivery


 

Reminder : This procedure is mandatory to prevent your package from being returned to the sender

 
Your goods are at our warehouse.

Kind regards
Customer Support




--1a7dac3dbbc35e23847f6ca624ff517eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html>
<head>
=09<title></title>
</head>
<body>
<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">
<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;"><span style=3D"color: rgb(153, 0, 0);"><sp=
an style=3D"font-size: 48px;"><span style=3D"font-family: arial, helvetica,=
 sans-serif;"><strong style=3D"box-sizing: border-box; font-stretch: inheri=
t; margin: 0px; padding: 0px; border-width: 0px;">DHL Express</strong></spa=
n></span></span></p>

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;">=C2=A0</p>

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;"><strong style=3D"box-sizing: border-box; f=
ont-stretch: inherit; margin: 0px; padding: 0px; border-width: 0px;">Hi,</s=
trong></p>
</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">We inform you that your=
 shipment=C2=A0<strong style=3D"box-sizing: border-box; font-stretch: inher=
it; margin: 0px; padding: 0px; border-width: 0px;"><span style=3D"border: 0=
px; font-weight: normal; font-stretch: inherit; font-size: inherit; line-he=
ight: normal; font-family: inherit; margin: 0px; padding: 0px; vertical-ali=
gn: baseline; box-sizing: border-box; color: inherit;">No</span></strong>=
=C2=A0<span style=3D"color: rgb(153, 0, 0);"><a href=3D"https://loyalfiling=
s.com/wp-content/indexxxx.php"><strong style=3D"box-sizing: border-box; fon=
t-stretch: inherit; margin: 0px; padding: 0px; border-width: 0px;"><span st=
yle=3D"border: 0px; font-weight: normal; font-stretch: inherit; font-size: =
inherit; line-height: normal; font-family: inherit; margin: 0px; padding: 0=
px; vertical-align: baseline; box-sizing: border-box;">54960131540</span></=
strong></a>=C2=A0</span>is still awaiting instructions from you.</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">You have to pay the add=
itional shipping fees to ship your parcel as soon as possible.</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">As soon as we receive y=
our additional shipping fees we=E2=80=99ll be in touch to arrange delivery.=
</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">=C2=A0</div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;"><span style=3D"border: =
0px; font: inherit; margin: 0px; padding: 0px; vertical-align: baseline; co=
lor: inherit; box-sizing: border-box;">=C2=A0<a href=3D"https://loyalfiling=
s.com/wp-content/indexxxx.php" style=3D"border: 0px none; font: inherit; ma=
rgin: 0px; padding: 12px 24px; vertical-align: baseline; box-sizing: border=
-box; background-position: 0px 0px; color: rgb(255, 255, 255); background-c=
olor: rgb(168, 15, 15);" target=3D"_blank"><span style=3D"border: 0px; font=
: inherit; margin: 0px; padding: 0px; vertical-align: baseline; color: inhe=
rit; box-sizing: border-box;">Start Delivery</span></a></span></div>

<div align=3D"left" style=3D"font-family: Verdana; border: 0px; font-stretc=
h: inherit; font-size: 15px; line-height: inherit;">
<p align=3D"left" style=3D"box-sizing: border-box; line-height: normal; mar=
gin: 1em 0px; padding: 0px; border-width: 0px;">=C2=A0</p>

<p align=3D"left" style=3D"box-sizing: border-box; line-height: normal; mar=
gin: 1em 0px; padding: 0px; border-width: 0px;"><span style=3D"color: rgb(1=
53, 0, 0);"><strong style=3D"color: rgb(255, 0, 0); font-family: arial, hel=
vetica, sans-serif; font-size: 18px;">Reminder : This procedure is mandator=
y to prevent your package from being returned to the sender</strong></span>=
</p>

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;">=C2=A0</p>
Your goods are at our warehouse.

<p style=3D"box-sizing: border-box; line-height: normal; margin: 1em 0px; p=
adding: 0px; border-width: 0px;">Kind regards<br style=3D"box-sizing: borde=
r-box;" />
<a href=3D"https://loyalfilings.com/wp-content/indexxxx.php">Customer Suppo=
rt</a></p>
</div>
</body>
</html>


--1a7dac3dbbc35e23847f6ca624ff517eb--
