Return-Path: <SRS0=X12G=IS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA31C433C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Mar 2021 18:46:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697816193D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Mar 2021 18:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697816193D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z1Wf//5WDR3CtMk4N7L9Ahftq7wsLqiUMiPdysjMk0E=; b=VbvXtvRUlUqviWM2aER++Y/Nr
	75ujooPnAXoraAgbs03ugFkNBr6kcYKYeDkERu0R99eby6+GosvDu4wbFyOQJmP73gHO6wvvU/m9b
	KclCT/Q+fWOIWb+cpvwW+OcKt2XIft+scDQkcw+Mj+PtOLuH7G/TDzK/+Gn0hjtppMm4gbaXODYiT
	TPHaJe5bIQ4DwIYcn05r4YInGu/uB6YjhLHCo/enpZiWImnEhv5T3UPZM7aN49mJB6DYh7wEsWjBt
	cc5DkwPlNH/BpOIfpd0ViorjdA/Sr0imHu4FSRq9YHA+9litw7Hl3k92qfb9ZiUNsj7Sf4XSi2j/h
	vpXP9ryIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNgam-009ALP-NH; Sat, 20 Mar 2021 18:44:57 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNgai-009AL1-0S
 for linux-arm-kernel@lists.infradead.org; Sat, 20 Mar 2021 18:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616265888;
 bh=d1vLtDraAtkMqHk6HROk38CMMUZVffe5COQYlFCGvjg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gNCTz1TEHRD3nAWVERGBvz4eZtmiAjN1QtMt2n43X0jxFLlx4dSyyFpRWQbcD7SsG
 sqrCM1lJJwfsbL8EjJBEkZE+mXVWXFRgmBZt+DK62V5ObZHYr734SKMdSgrODFrMCv
 08bhd2ueFbhd2Y4GAwbVyobiuRz+UtgWVNnoLfW0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1l6IKX1U3N-00HveN; Sat, 20
 Mar 2021 19:44:48 +0100
Date: Sat, 20 Mar 2021 19:44:47 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
List-Id: <soc.lore.kernel.org>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH 13/14] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F
 based on WPCM450
Message-ID: <YFZCnwmKT89wTGml@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-14-j.neuschaefer@gmx.net>
MIME-Version: 1.0
In-Reply-To: <20210320181610.680870-14-j.neuschaefer@gmx.net>
X-Provags-ID: V03:K1:vkJZm344XxWzxVLFJbgPxKxyIbETOxSDelWoxR9zduf2ke/h6S1
 rtcyQ5bS8j4Rt1IDy2rYrFSM/cuqC6RUd0+uJIXVOWc4/R/8ry4RiC4AC6IeX4s6kmaklSs
 mWjcRN/cGCa0iejgJRV8O9Ppe9EyXj3k3/uyyGjkKaWXe+1OvAoMcSlHY1KB31CmuJ1qdoy
 vBo4qhz5Tiz27mr9mdfHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+XV7oEPMWik=:6W/DHQC9ZT3vehD8OtkMIu
 1Q2hSz5ctzZElAhfO1eiNyvI0ZpY6n9mD2ARiG0vz3FOoMqg2knX52cLYLaYd5RZJB96ZUuhd
 2vP3RiVRgwxR//WtvvV1uajqChJy6j6qYXtuDAqkQBhdZ8aY6EiDPjiRIvq+rzPe5XtmuBf6h
 YtViZ9E0yMIUaPl4qBHQ9g58YnwEqWj9JZQTKzxb4HNsfgZsXLO+SRBSVmmMVgh+kjByVhah7
 MGDHRaiaNIqGpww63zlH+ekbe1ZnYAKU7M77iKzKnu7O64Lw1Krh2kT7OHQRUCD1SryHpNu1F
 iuHKoc1BzAHFCyGGHoJ3+tYRB/g3NN6QnietagsiOuPJ79PmLgAxM6sXNeJrQFY1glj0SP1jx
 aJ9Yk7FxHv/gKf3dMnjAQ7u15/AhmbUQG5hFwH/Ajdk5GPDiBUrFHtqhGcVRcHa2vgGrIAoU1
 HNMBOivEKSckt6jADpfWyj8wRcDJ4vhFTckcbaF9C81ngCaDmiFmGPsfd/UcXOOYIJXj2rAux
 dmz0Sv+K1Gw1egALPtpwkmuOC6cAUF679QbP+TUL97uwZIhyBgZT7dObxFz+6s/dIf5eVDEUM
 JNB345QHXf4XYRoA2qgkLVlM1S+YPP6PMh2u7lFJqutlI7nsagZdap9qoOzRTaMQ6JOEPv0cs
 3ULNTZU6gySFjwPIay9idSzIruxCEg1LPQt4vceRC/UmeTD8y6V9bOMyQbEfOBjJZ4yEACYSz
 fT3OM63NVixoiFAyboAPnlISGJFatBZG36IKP7skabR3uQhIrmPoCH8ALs3uWR24X9UbFLhlO
 DANHgr3HLhaGDnY0IlKFdezhjxgA3tgd9RswMlwxnNSOOAemOB13kDzXAmL/Iw+l7NtPjIkUw
 ycJX27yhIUASt+Ij4DoA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_184452_197805_36B52048 
X-CRM114-Status: GOOD (  13.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1826829745898910154=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210320184447.Cqfa3bK5VLi88oTY3XDPGV4ur3TbvOLn-xpOku-gAzg@z>


--===============1826829745898910154==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z1VQwSmFz+hiTBWT"
Content-Disposition: inline


--Z1VQwSmFz+hiTBWT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 20, 2021 at 07:16:09PM +0100, Jonathan Neusch=C3=A4fer wrote:
> The Supermicro X9SCi-LN4F is a server mainboard featuring the WPCM450
> BMC. This patch adds a minimal devicetree for Linux running on the BMC.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
[...]
> +&serial1 {
> +	/* "Serial over LAN" port. Connected to ttyS2 of the host system. */
> +	status =3D "okay";
> +};

One thing to note here: The SOL functionality doesn't work with this
patchset alone, because it requires a special register setting in the
SoC's System Global Control Register block (SPSWC.SPMOD =3D 2).

So it might make sense to drop the serial1 enablement for now.


Jonathan Neusch=C3=A4fer

--Z1VQwSmFz+hiTBWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBWQpAACgkQCDBEmo7z
X9tGjQ//aEFlx3SOxaQ8W9hBuavu5Rzz+ztJmvFmw6zDW89XgAdw4nn8blv3UG1M
Kb1DiUuvsCJZMmr0xeKYn98lMpewRE6n0xIc5EFSVrS8TYJ6A/eWZPlc5YLF4KrX
A5IKyQSOjkBx6X1joLYVGvPjTwf0JSY7m1k4l30hcYhnnGSd37tIxcw08THb9fQd
JmB5t8zM5zmDicoPJbH2TUZW1ndLVbBLCzcYKWeIf2aSUFA6R9sZqeXSb9L6TQpp
sdoWXnNlGPOKZmUc4A1SvOOyFf1IdgfQ/lXar53EP0PgC8amX+YL/hm+vRY0iVk5
XLLlfp2e7jCdoDd0jpaY7HrdgBWTMJUOkJVLVqFAEo/N9k2eqroelzw9pywLoxvT
nr5gG32XJvV5+v8Y7hfr+9QzEYPMR50Hb/XbY3urdnoCBVyleRs30CsCqHoitn+X
krhg6Py0Ri8WCx86gfdCcOx1wUorV6V6U5iRQRxkwxnlDWxZwg6LHtm5juAmMxzS
/sIv5FluU2oOgyVrAMVcH1D1soadCyOkhoY2uuF90rNj8C9e9KkVPpvWeIEjOFNv
Ew3Lc2X6s4wQ9Vqvsa0tvvwLwxVBf10T7qSuiFTR+UMcbqEm4vSjHK0a+Lpbaepe
tUYQ5x4fCGzXlYGsujtxYreG3wQK4KqnXITrnov7WM4pOVa2Fxg=
=b1Yc
-----END PGP SIGNATURE-----

--Z1VQwSmFz+hiTBWT--


--===============1826829745898910154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1826829745898910154==--

