Return-Path: <SRS0=JlQH=QO=benettiengineering.com=giulio.benetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525E6C433EF
	for <soc@archiver.kernel.org>; Sat, 27 Nov 2021 02:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CDDEC53FC1; Sat, 27 Nov 2021 02:25:36 +0000 (UTC)
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
	by smtp.kernel.org (Postfix) with ESMTP id 73168C004E1
	for <soc@kernel.org>; Sat, 27 Nov 2021 02:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73168C004E1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=benettiengineering.com
Received: from smtpclient.apple ([146.241.138.59])
	by Aruba Outgoing Smtp  with ESMTPA
	id qnO2mtBWC5cjnqnO2mtcoB; Sat, 27 Nov 2021 03:24:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1637979865; bh=3I4BsjgcAXeXaP6VSFRuSe9/LMf5n9gT/9EZJzZkxC8=;
	h=Content-Type:From:Mime-Version:Subject:Date:To;
	b=YYfhXNWXvJa8gQVG4JdwOK18AYAtluqsiMmHgAYh9Ppqi++Iw+7mInEbKwLJe8t/m
	 JAhMBhKNAYS5j14daoj7SdTjcH+IqRKxxBXyrLWNjIalNh7GMqxGv9FG7S6PFW/fKb
	 XxwGoOLealFS2wtVikL1e+3C0n8JRARNV93ipaYpQFsK5nd4NskE+eOcaI8ITe2/TK
	 yjUJI6xBmEgHnZLCxiAjYrfGaorJme94Coj6YsfQSmeUUeKxCpqy9Z7CZ67G6nDtcW
	 kisMvN6a4X/9NMhXnF7OCGX0CW9hrdrvY+Hkjqj1MNWAWeCJYHYoWufy8Hy3ODptmN
	 GmMcfEM1mbOiw==
Content-Type: multipart/alternative; boundary=Apple-Mail-E746FCDD-7F07-4B59-8351-B7AE19329216
Content-Transfer-Encoding: 7bit
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 04/13] pinctrl: freescale: Add i.MXRT1050 pinctrl driver support
Date: Sat, 27 Nov 2021 03:24:21 +0100
Message-Id: <1A6F8E77-054B-4B7F-B533-82BB0CB7B994@benettiengineering.com>
References: <CACRpkdaf9EoR15fOMXipr-z0zqwdDNtS_j9n7_M0QvxGYi2Gdg@mail.gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
 adrian.hunter@intel.com, jirislaby@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
In-Reply-To: <CACRpkdaf9EoR15fOMXipr-z0zqwdDNtS_j9n7_M0QvxGYi2Gdg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4xfM3I4SdxGO68BDGCPSvA6kR0meIxWFAepO9WmQwWE4/3l3rasZpXV+ix+JQ0083sFAjNbJ8RsCoZr1YCr+3T6IpDux9T/szyZoZIxj6OJtQ6uWUkntrE
 sV4cYrQfWGruZIn8lSy+MznLLFLM/UqvT593zCQAX8hAS6pkCv00NqGhXuvInYnHoiMEQGjGsyVNmITny07Pt+0bZCTtp22OZpdShUm76xuENAtxKT9C9TZP
 pV4hgcojm6/SDfc+yH2zFW2CZj8OKpu9Bqvk5eG0su4Pzj95YHYWYmvfkVw97X6NCbIXKRhDtsMMfCMg6A0bWneQJ53xbYTuJ74DMo5K/Ba0hXpjiGLMc6Nj
 seWgMjEfAzhbbsYbj1cClRqlIAKkzlVoDo3/C60PyrMMUFI8rNTojctkgofdSrBQ5B84cIrQv2DgvpsiZutVMN2mWSA8pIownlZBvIYW7IZkI8LLYtn3C8PI
 DeFGci27nF9/3wYitvrXUUA4WUMVW7kOhPRM/VrCoMYKgxjrRBtphjG302+vuX4c/5KiVdcBwAW6uaK3NbO8JEU5/ABB8/osPnSaf07NPvkP7ankuzebkh0O
 Pf61B+oRreOL6avySamv/GIi46zYCJ8AAYQBzELtrOjwePAljkgqr4lsIQLSnJwFZlkrl2Fuar/szDvALpEeqgqQOv9ZDf5RPxc05FGEKKfIkIHFQ87H2BW/
 v45cyiS3DVYX12zVjATxyhdD17pEBBM5sI5wHBqBy5vmNeroRKDHyv7pfvJrZ5eVNtWgJGdlqcVv/h94gXc9DkrkVpz1Vz1EXlAJ4uYu/iG2Pv7rWJkaw4ns
 bzVrAC0ifK4poqwJCpAL4pOWiRFXmGDfWZ5IKIHIGD5jw8V8oFEq7KEQj9308LTvt0pzaT+pjXUt9HwPku/KjBt6CS6quCKWDZMkC5GxaGk1YKW9J7dqkPAx
 wYyI/DqIrOYYZ6UEW3BOBMfgo82Uu4WKkrnfuRNL7KfDxGqYO8bOuJ08BnVfAaqKFnwXbWieFH6KSnKU3Mu1wLfysUzNkmkw8JSLhDQx2VL380hzdfK7ATkE
 B7EEQ3Wmq+xCPjqIDKGe4v8VJ8snbhULjlyo5qS4TQj/+38VvSizDRLG+Vuugl2eK45LJkzbjHzG04/6zNySC6rPSE9so7zOTH/jKX9Y6eK3XfiG505diNZk


--Apple-Mail-E746FCDD-7F07-4B59-8351-B7AE19329216
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Linus,

> Il giorno 27 nov 2021, alle ore 02:43, Linus Walleij <linus.walleij@linaro=
.org> ha scritto:
>=20
> =EF=BB=BFOn Thu, Nov 25, 2021 at 10:14 PM Jesse Taube <mr.bossman075@gmail=
.com> wrote:
>=20
>> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>=20
>> Add the pinctrl driver support for i.MXRT1050.
>>=20
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>> V1->V2:
>> * Nothing done
>> V2->V3:
>> * Nothing done
>=20
> I need a review from one of the Freescale pinctrl driver maintainers for t=
his
> patch.

Yes.

Anyway for what it=E2=80=99s worth this file is already part of uboot:
https://source.denx.de/u-boot/u-boot/-/blob/master/include/dt-bindings/pinct=
rl/pins-imxrt1050.h

But yes, it=E2=80=99s better they take a look.=20

Best regards
Giulio Benetti
Benetti Engineering sas

>=20
> Yours,
> Linus Walleij

--Apple-Mail-E746FCDD-7F07-4B59-8351-B7AE19329216
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello Linus,<br><div dir=3D"ltr"><br><block=
quote type=3D"cite">Il giorno 27 nov 2021, alle ore 02:43, Linus Walleij &lt=
;linus.walleij@linaro.org&gt; ha scritto:<br><br></blockquote></div><blockqu=
ote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Thu, Nov 25, 2021 at 10=
:14 PM Jesse Taube &lt;mr.bossman075@gmail.com&gt; wrote:</span><br><span></=
span><br><blockquote type=3D"cite"><span>From: Giulio Benetti &lt;giulio.ben=
etti@benettiengineering.com&gt;</span><br></blockquote><blockquote type=3D"c=
ite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Add the p=
inctrl driver support for i.MXRT1050.</span><br></blockquote><blockquote typ=
e=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Sig=
ned-off-by: Giulio Benetti &lt;giulio.benetti@benettiengineering.com&gt;</sp=
an><br></blockquote><blockquote type=3D"cite"><span>Signed-off-by: Jesse Tau=
be &lt;Mr.Bossman075@gmail.com&gt;</span><br></blockquote><blockquote type=3D=
"cite"><span>---</span><br></blockquote><blockquote type=3D"cite"><span>V1-&=
gt;V2:</span><br></blockquote><blockquote type=3D"cite"><span>* Nothing done=
</span><br></blockquote><blockquote type=3D"cite"><span>V2-&gt;V3:</span><br=
></blockquote><blockquote type=3D"cite"><span>* Nothing done</span><br></blo=
ckquote><span></span><br><span>I need a review from one of the Freescale pin=
ctrl driver maintainers for this</span><br><span>patch.</span><br></div></bl=
ockquote><div><br></div><div>Yes.</div><div><br></div><div>Anyway for what i=
t=E2=80=99s worth this file is already part of uboot:</div><div><a href=3D"h=
ttps://source.denx.de/u-boot/u-boot/-/blob/master/include/dt-bindings/pinctr=
l/pins-imxrt1050.h">https://source.denx.de/u-boot/u-boot/-/blob/master/inclu=
de/dt-bindings/pinctrl/pins-imxrt1050.h</a></div><div><br></div><div>But yes=
, it=E2=80=99s better they take a look.&nbsp;</div><div><br></div><div>Best r=
egards</div><div>Giulio Benetti</div><div>Benetti Engineering sas</div><br><=
blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>Yours,</spa=
n><br><span>Linus Walleij</span><br></div></blockquote></body></html>=

--Apple-Mail-E746FCDD-7F07-4B59-8351-B7AE19329216--
