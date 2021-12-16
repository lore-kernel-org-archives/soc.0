Return-Path: <SRS0=AEIb=RB=benettiengineering.com=giulio.benetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3350C433F5
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 17:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9142AC36AE4; Thu, 16 Dec 2021 17:26:53 +0000 (UTC)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
	by smtp.kernel.org (Postfix) with ESMTP id AEE8AC36AE5
	for <soc@kernel.org>; Thu, 16 Dec 2021 17:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEE8AC36AE5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=benettiengineering.com
Received: from smtpclient.apple ([146.241.138.59])
	by Aruba Outgoing Smtp  with ESMTPA
	id xuWbmZf0yq3qKxuWcmCwNt; Thu, 16 Dec 2021 18:26:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1639675602; bh=wU0CXLxQOma5eUznfPm3llolS/95Uu8r5jUeoABOP4o=;
	h=Content-Type:From:Mime-Version:Subject:Date:To;
	b=V2rsWDRs/eYlqW+TfbCYJAgxTmjeEHdD0DQUPqGOw7SN2D49/E0eSjnzI9LlKtcsI
	 V0k3plpleIa123s2ct0fI++luIdQr4h67mi2N87niSITbWE0ELdP4aysKqKIbKtmNP
	 j7/NHRjaJEWSxX1DLmCSUFPwMXf00O3HdTOWjoWoD3oqjdvqK77J639lH96jQ16Hyg
	 Bd7FG/Dn7lNWJa2WAQFKflNVoMLT684uaIAMRDAcj6r2/2CVmiuujS22aSAZX+4sG5
	 1TXK8atnUXncRscr8a9VQT6+HyT4Dci9SuvJuIfyGbCRto78fWnK037Q+2Zt/6raSV
	 rOQKHaIDATWLw==
Content-Type: multipart/alternative; boundary=Apple-Mail-E8847211-006A-4E6D-8338-BF57AA2261A0
Content-Transfer-Encoding: 7bit
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 0/9] Add initial support for the i.MXRTxxxx SoC family starting from i.IMXRT1050 SoC.
Date: Thu, 16 Dec 2021 18:26:37 +0100
Message-Id: <21CC5841-7425-4A4D-AE02-D596DE5EBDED@benettiengineering.com>
References: <CAK8P3a29tzgd_4WncippZBEJra9n0bQTysBkPBp_WA0sb28gTg@mail.gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>,
 gregkh <gregkh@linuxfoundation.org>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
In-Reply-To: <CAK8P3a29tzgd_4WncippZBEJra9n0bQTysBkPBp_WA0sb28gTg@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4wfCXuX0JlNk0SQRHitV4KFF2n/11U+j7O8gKh5aBNN8bM3ujm5vadWozvFz+VnNcUuQPW8JmS1ud0H+/RurfZ3HSCUd7QE2IbnSOALSuJsFBabumFSt2y
 DZbRBUY6/w+UUd35/CWOXt412XAYPnNbCDP+nlKTrw9Nzum/gXJxMX4XxOGqCSJfb/yv9NHyd+XqptfAi8ZbVs5oDr4OmcN23BMdDiJqZqdyq04AKM/De3Bd
 mXJbumYoWZWHbwLvFjawgIsgMkYaGekGmm1rjal6IAxiud+ZocEGy/qkuHF0aKkHmCb5rm0899jPuMnkm6eRs5Vz7p6f2XfGQRZufAivZlVkxdyD8oHDp3ZO
 XkOh1jo5Y5pwjlBDrieO5JlleoCIZsz+g+Fijb8aI6pOHxKBpyEcRjtpCQoq5zoP4YWo2R/G+pRqMoL2z2MIstXyOpp16JvOetrFeB/GO2EbxTSUpymz5K1J
 IK2e6Zqg6I9k3Pe+SlaWfjN7e+SsFaP1OVdC+cQNe7YYxZPqW7T+qv3khRwhV4EewV1SZ6oWd/eqgeEvyQ8W389kO9kSfMV7bg+Lk0tbC3FWmzhmWw/nHGgh
 NEhUJp0nW2i1c4oTAhu098qk/UNdkDZimfmipCmxXpKYYNN7P9rC2PSY49EdFKURkLE5Onqj/09kZ/1eKW2U5Vjx5jhM1jPGY0xYx77qKEL9MjjlUJX2qCU+
 MfjpmdJPZXi34fLrai4wWmi+awW9JubCGXY3yR9hsNb+GC5iLGcUSYtELboYLTAps+dRDOi/pVxT/sBSK8gOErlYEEhBi3CRv8eQiKJf42P+w2Q1i+9R3xMQ
 Lr1Nf3Ubnhf9XnPT08V1wdolnNSLiCEmFwjarzwz4aVHHNeSiCQypXca3XQrjAznwDkYHfBtdG201mUKmzdZ3oNYOSjRrMzmrnrZaWs6SuLgh/2ynE7mt3yA
 DgDv4SGiICnLGTQMrcC6LjA79Gc2/cWJjcRzlco6gtiivEq4okfMYC/55CeGQzkkOKDKHb/B9+3DjHOQDcpzxl/L4PXsV/2jkOJyX5Ih+baIytE8NNDTd5Ib
 9Mu7cZIY2/nShgjSsjE2538ZWKupEfr0TQbYFzT4kBjU82l4brDS9r5b33X1aEhuna7ZxYb5WkqmOqv90sEx7ziOj+NiitaZQdc=


--Apple-Mail-E8847211-006A-4E6D-8338-BF57AA2261A0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Jesse, All,

> Il giorno 16 dic 2021, alle ore 09:26, Arnd Bergmann <arnd@arndb.de> ha sc=
ritto:
>=20
> =EF=BB=BFOn Wed, Dec 15, 2021 at 11:05 PM Jesse Taube <mr.bossman075@gmail=
.com> wrote:
>>=20
>> This patchset contains:
>> - i.MXRT10xx family infrastructure
>> - i.MXRT1050 pinctrl driver adaption
>> - i.MXRT1050 clock driver adaption
>> - i.MXRT1050 sd-card driver adaption
>> - i.MXRT1050 uart driver adaption
>> - i.MXRT1050-evk basic support
>>=20
>> The i.MXRTxxxx family that could have support by Linux actually spreads
>> from i.MXRT1020 to i.MXRT1170 with the first one supporting 1 USB OTG &
>> 100M ethernet with a cortex-M7@500Mhz up to the latter with i.MXRT1170
>> with cortex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,
>> 2x 1Gb and 1x 100Mb ENET. The i.MXRT family is NXP's answer to
>> STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4 or
>> less layer PCBs. Seeing that these chips are comparable to the
>> STM32F7XXs which have linux ported to them it seems reasonable to add
>> support for them.
>>=20
>> Giving Linux support to this family should ease the development process,
>> instead of using a RTOS they could use Embedded Linux allowing for more
>> portability, ease of design and will broaden the scope of people using
>> embedded linux.
>>=20
>> The EVK has very little SDRAM, generally 32MB starting from
>> i.MXRT1020(the lowest P/N), although the i.MXRT1160/70 provide instead
>> 64MB of SDRAM for more functionality.
>>=20
>> At the moment we do not support XIP for either u-boot or Linux but it
>> should be done in the future. XIP will also save SDRAM.
>>=20
>> Another interesting fact is the amount of internal SRAM, as the P/N
>> increases the SRAM will reach up to 2MB(some could be for cache and
>> some would be for video).
>>=20
>> Also, some parts have embed flash of 4MB that can be used for
>> u-boot/Linux, if both correctly sized it will leave the SDRAM free.
>>=20
>> External flash can be Quad SPI and HyperFlash, so throughput would be
>> decent.
>>=20
>> The i.MXRT11xx series supports MIPI interface too.
>>=20
>> The family in general provide CAN bus, audio I/O, 1 or more
>> USB(otg/host), 1 or more 100Mb/1Gb ethernet, camera interface, sd-card.
>>=20
>> All this can be used for simple GUIs, web-servers, point-of-sale
>> stations, etc.
>=20
> This looks all good to me now, but the drivers need to be reviewed by the
> respective subsystem maintainers before we can merge it into the soc
> tree. As with other new SoCs, I'm happy to merge the support as a combined=

> pull request that includes the drivers provided that the driver subsystem
> maintainers have reviewed them.
>=20
> Ideally the i.MX maintainers would pick up your series into a separate
> branch and send that to soc@kernel.org the same way as the other topic
> branches that are usually split out between DT, drivers, soc code etc.
>=20
> With the Christmas break coming up, the timing may not be sufficient
> before I'm off next week, so it may end up too late for 5.17 but should
> be fine for 5.18.
>=20
> As a more general comment, it's always nice to see newly added SoC
> platforms, especially when they are this well implemented and done
> by hobbyists. However, I do think you are being overly optimistic
> as to how useful this is going to be to other people: interest in NOMMU
> ARM platforms has dropped a lot over the past 5 years, and as far as I
> can tell, it is only being kept alive for existing stm32 customers
> as the economics do not favor Linux on Cortex-M for new products
> compare to Linux on Cortex-A or some RTOS on Cortex-M.
>=20
> The existing users will inevitably stop updating their kernels at some
> point, and then it's most likely just you and Vladimir Murzin that care.

About this will you accept support for the other SoCs in the family?
We would like to add in the near future:
- i.MXRT1020(uboot support is already upstreamed)
- i.MXRT1024(almost equal to 1020)
- i.MXRT1060(almost equal to 1050)
- i.MXRT1064(almost equal to 1060)

And the i.MXRT1160/70 new family with faster core clock(1Ghz) and a cortex M=
4.

We need to add missing lcd(uboot upstreamed), usb(uboot upstreamed), etherne=
t(wip) supports
for i.MXRT10xx family.

This is to organize with Jesse also about buying evaluation boards and timin=
g.

We=E2=80=99ve meant this porting also as an exercise to deal with Linux deep=
er for us and for the other newbies.

We=E2=80=99ve been also asked about a possible support for s32s(quad cortex-=
R52) on initial emails but it has no mmu too.
While I=E2=80=99m seeing that some cortex-R is landing inside Linux.
Would it be interesting anyway?

Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

>=20
>       Arnd

--Apple-Mail-E8847211-006A-4E6D-8338-BF57AA2261A0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Arnd, Jesse, All,<br><div dir=3D"ltr"><b=
r><blockquote type=3D"cite">Il giorno 16 dic 2021, alle ore 09:26, Arnd Berg=
mann &lt;arnd@arndb.de&gt; ha scritto:<br><br></blockquote></div><blockquote=
 type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Wed, Dec 15, 2021 at 11:05=
 PM Jesse Taube &lt;mr.bossman075@gmail.com&gt; wrote:</span><br><blockquote=
 type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span=
>This patchset contains:</span><br></blockquote><blockquote type=3D"cite"><s=
pan>- i.MXRT10xx family infrastructure</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>- i.MXRT1050 pinctrl driver adaption</span><br></blockquot=
e><blockquote type=3D"cite"><span>- i.MXRT1050 clock driver adaption</span><=
br></blockquote><blockquote type=3D"cite"><span>- i.MXRT1050 sd-card driver a=
daption</span><br></blockquote><blockquote type=3D"cite"><span>- i.MXRT1050 u=
art driver adaption</span><br></blockquote><blockquote type=3D"cite"><span>-=
 i.MXRT1050-evk basic support</span><br></blockquote><blockquote type=3D"cit=
e"><span></span><br></blockquote><blockquote type=3D"cite"><span>The i.MXRTx=
xxx family that could have support by Linux actually spreads</span><br></blo=
ckquote><blockquote type=3D"cite"><span>from i.MXRT1020 to i.MXRT1170 with t=
he first one supporting 1 USB OTG &amp;</span><br></blockquote><blockquote t=
ype=3D"cite"><span>100M ethernet with a cortex-M7@500Mhz up to the latter wi=
th i.MXRT1170</span><br></blockquote><blockquote type=3D"cite"><span>with co=
rtex-M7@1Ghz and cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU,</span><br><=
/blockquote><blockquote type=3D"cite"><span>2x 1Gb and 1x 100Mb ENET. The i.=
MXRT family is NXP's answer to</span><br></blockquote><blockquote type=3D"ci=
te"><span>STM32F7XX, as it uses only simple SDRAM, it gives the chance of a 4=
 or</span><br></blockquote><blockquote type=3D"cite"><span>less layer PCBs. S=
eeing that these chips are comparable to the</span><br></blockquote><blockqu=
ote type=3D"cite"><span>STM32F7XXs which have linux ported to them it seems r=
easonable to add</span><br></blockquote><blockquote type=3D"cite"><span>supp=
ort for them.</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>Giving Linux support to thi=
s family should ease the development process,</span><br></blockquote><blockq=
uote type=3D"cite"><span>instead of using a RTOS they could use Embedded Lin=
ux allowing for more</span><br></blockquote><blockquote type=3D"cite"><span>=
portability, ease of design and will broaden the scope of people using</span=
><br></blockquote><blockquote type=3D"cite"><span>embedded linux.</span><br>=
</blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockq=
uote type=3D"cite"><span>The EVK has very little SDRAM, generally 32MB start=
ing from</span><br></blockquote><blockquote type=3D"cite"><span>i.MXRT1020(t=
he lowest P/N), although the i.MXRT1160/70 provide instead</span><br></block=
quote><blockquote type=3D"cite"><span>64MB of SDRAM for more functionality.<=
/span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquo=
te><blockquote type=3D"cite"><span>At the moment we do not support XIP for e=
ither u-boot or Linux but it</span><br></blockquote><blockquote type=3D"cite=
"><span>should be done in the future. XIP will also save SDRAM.</span><br></=
blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquo=
te type=3D"cite"><span>Another interesting fact is the amount of internal SR=
AM, as the P/N</span><br></blockquote><blockquote type=3D"cite"><span>increa=
ses the SRAM will reach up to 2MB(some could be for cache and</span><br></bl=
ockquote><blockquote type=3D"cite"><span>some would be for video).</span><br=
></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><block=
quote type=3D"cite"><span>Also, some parts have embed flash of 4MB that can b=
e used for</span><br></blockquote><blockquote type=3D"cite"><span>u-boot/Lin=
ux, if both correctly sized it will leave the SDRAM free.</span><br></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>External flash can be Quad SPI and HyperFlash, so throughpu=
t would be</span><br></blockquote><blockquote type=3D"cite"><span>decent.</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><span>The i.MXRT11xx series supports MIPI interfa=
ce too.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></=
blockquote><blockquote type=3D"cite"><span>The family in general provide CAN=
 bus, audio I/O, 1 or more</span><br></blockquote><blockquote type=3D"cite">=
<span>USB(otg/host), 1 or more 100Mb/1Gb ethernet, camera interface, sd-card=
.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockq=
uote><blockquote type=3D"cite"><span>All this can be used for simple GUIs, w=
eb-servers, point-of-sale</span><br></blockquote><blockquote type=3D"cite"><=
span>stations, etc.</span><br></blockquote><span></span><br><span>This looks=
 all good to me now, but the drivers need to be reviewed by the</span><br><s=
pan>respective subsystem maintainers before we can merge it into the soc</sp=
an><br><span>tree. As with other new SoCs, I'm happy to merge the support as=
 a combined</span><br><span>pull request that includes the drivers provided t=
hat the driver subsystem</span><br><span>maintainers have reviewed them.</sp=
an><br><span></span><br><span>Ideally the i.MX maintainers would pick up you=
r series into a separate</span><br><span>branch and send that to soc@kernel.=
org the same way as the other topic</span><br><span>branches that are usuall=
y split out between DT, drivers, soc code etc.</span><br><span></span><br><s=
pan>With the Christmas break coming up, the timing may not be sufficient</sp=
an><br><span>before I'm off next week, so it may end up too late for 5.17 bu=
t should</span><br><span>be fine for 5.18.</span><br><span></span><br><span>=
As a more general comment, it's always nice to see newly added SoC</span><br=
><span>platforms, especially when they are this well implemented and done</s=
pan><br><span>by hobbyists. However, I do think you are being overly optimis=
tic</span><br><span>as to how useful this is going to be to other people: in=
terest in NOMMU</span><br><span>ARM platforms has dropped a lot over the pas=
t 5 years, and as far as I</span><br><span>can tell, it is only being kept a=
live for existing stm32 customers</span><br><span>as the economics do not fa=
vor Linux on Cortex-M for new products</span><br><span>compare to Linux on C=
ortex-A or some RTOS on Cortex-M.</span><br><span></span><br><span>The exist=
ing users will inevitably stop updating their kernels at some</span><br><spa=
n>point, and then it's most likely just you and Vladimir Murzin that care.</=
span><br></div></blockquote><div><br></div><div>About this will you accept s=
upport for the other SoCs in the family?</div><div>We would like to add in t=
he near future:</div><div>- i.MXRT1020(uboot support is already upstreamed)<=
/div><div>- i.MXRT1024(almost equal to 1020)</div><div>- i.MXRT1060(almost e=
qual to 1050)</div><div>- i.MXRT1064(almost equal to 1060)</div><div><br></d=
iv><div>And the i.MXRT1160/70 new family with faster core clock(1Ghz) and a c=
ortex M4.</div><div><br></div><div><span style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0);">We need to add missing lcd(uboot upstreamed), usb(ubo=
ot upstreamed), ethernet(wip) supports</span></div><div><font color=3D"#0000=
00"><span style=3D"caret-color: rgb(0, 0, 0);">for i.MXRT10xx family.</span>=
</font></div><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0);"><br></span></div><div>This is to organize with Jesse also about buying=
 evaluation boards and timing.</div><div><br></div><div>We=E2=80=99ve meant t=
his porting also as an exercise to deal with Linux deeper for us and for the=
 other newbies.</div><div><br></div><div>We=E2=80=99ve been also asked about=
 a possible support for s32s(quad cortex-R52) on initial emails but it has n=
o mmu too.</div><div>While I=E2=80=99m seeing that some cortex-R is landing i=
nside Linux.</div><div>Would it be interesting anyway?</div><div><br></div><=
div>Best regards</div><div>=E2=80=94-</div><div>Giulio Benetti</div><div>Ben=
etti Engineering sas</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><sp=
an></span><br><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Arnd</span><br></di=
v></blockquote></body></html>=

--Apple-Mail-E8847211-006A-4E6D-8338-BF57AA2261A0--
