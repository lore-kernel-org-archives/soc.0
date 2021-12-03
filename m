Return-Path: <SRS0=Yczl=QU=benettiengineering.com=giulio.benetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03834C433EF
	for <soc@archiver.kernel.org>; Fri,  3 Dec 2021 01:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3ADEC53FCC; Fri,  3 Dec 2021 01:04:15 +0000 (UTC)
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
	by smtp.kernel.org (Postfix) with ESMTP id EA6BEC53FD1
	for <soc@kernel.org>; Fri,  3 Dec 2021 01:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA6BEC53FD1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=benettiengineering.com
Received: from smtpclient.apple ([146.241.138.59])
	by Aruba Outgoing Smtp  with ESMTPA
	id swzbmSvdGz3hmswzbmreyZ; Fri, 03 Dec 2021 02:04:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1638493446; bh=mZkqN1sF9h5FGn08aTbJ5qjs7uh2qvDodxtiSb/UAHA=;
	h=Content-Type:From:Mime-Version:Subject:Date:To;
	b=KwSD57VJevuSciMLKYou0rSsEfSk0BdMkSt8m/w06ODNecWNZbM3qgyP1wSrJlgZO
	 OZTk3ps9DB136y3OMhpuThg8DOTDwj9MNevcBIICfAkczkHStUA8Pld8E6ut5+erPI
	 7evR67z1a/T+AfMhcQjo+xkeXp+n65bvDj/MW3IMND83DUEJUdpnrVcvCVC8Xkig9v
	 x/UJ8JWovTBdmkzrYXyXSZDz6Jls2EL7D/kLFvsJ3klDa91NtIInlOYNyIN1QI2ATJ
	 yDCjpLy+HHZwhWvnsunOz5n+aHxAL/j+LtifofLbBivyySFpXSJyBx6JhnYSN1u5Tk
	 eQfZAMwgSpVUQ==
Content-Type: multipart/alternative; boundary=Apple-Mail-3FFAB311-F41A-4B65-82E2-B42FF4D09E85
Content-Transfer-Encoding: 7bit
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Date: Fri, 3 Dec 2021 02:04:03 +0100
Message-Id: <3E371C48-DAA9-4CE7-A907-04D755C981AE@benettiengineering.com>
References: <c488ed94-ad0e-a326-adda-c4d782dbd6ef@benettiengineering.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
In-Reply-To: <c488ed94-ad0e-a326-adda-c4d782dbd6ef@benettiengineering.com>
To: Rob Herring <robh@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>
X-Mailer: iPhone Mail (19B74)
X-CMAE-Envelope: MS4xfNlHcwBjRXnLq7AEHEm4V2dXDoL4GJb5hZ0iYud3cVWtR7W7Rl0Ko35QQCkxlF2SzcX121T/aKWCyKTvT/hxKmObtf89BkjsFQh9wX0VcBJhiNIZmLFb
 XnzeLhxieH5kfkGI07ckjb/VisW2bL2vNdP8xF+rHMcp7MYxF6tbJL0nmsRtHiKB5/aXHxzS9ILq0RasUPwCIBjV1w2Y34R+No5KWJgJN+a6VjpPquxWS4gN
 B3YUVHkg7bZl0OcNRFllLW3TQYEX2F520Dx0REdNLriRmkip3P3Y1LxXRfksYPF65+NEPpVerLlsOFJUrondrp697rzuaKvSNWXAWjA3dNw3pUA+wISkOz5J
 mSEK6EFMq9LOkDZPy6mNl9YrTKh9ebz40666Ckgm7xK7v2Py5smAuGdTbFmeX1J1fUBoShSq2nsnT8WiHWTHR2z6bUA+jcwn1BixTnN4/9K1szJfwE42jqfc
 m/t/zMt3RPVldCp7jRMOOI9//pGxlkcVtTd+OdUg6+khWyv2CJrzkbhHzwWFV+S9PSyLt3sYjgZQpmBQUu6tbvxLJk4ZL2qHpwYeLOrReOVp012PclUUmLQ6
 lzhTiiWMp3a4jPY9N9YrJJ9VmavGyXSqCk5BDGqxf137zb/FDV6dxiXKnrwdDUG7mEhhki9QKNJk7fDcBa48qseruuZxZ2BrA/2rj3jJoUAsPWAJZDAvy2bD
 2f5HIAvO2nppr2ye3CC9jE781+HHLz1kjP4f2HWFXs3UYgwXFxoGkZW4K2pJB5ZUBX6Uwua7Z32yPdiEA+1XtOXKTFJj5uHBZuDDByLJoAjKcHy1dXRwd0qQ
 U09cZIq/sW4eOBN06A94/7doXdiVq9XtWf/PbEzxmhuJH50dR9gWwN6t5bu4IOfPN8tMMVPeymNQRjQ1tWMiOTGVpeDDcOKyewyTPrvqAO7LV/mIldqYsPpe
 0wHsDIaj67ug9LiSofrzi+cHgwwgQraAE1ZclpLHkYfMlqJGfmMg8oEPL6rYXTOUa981KFCmBm6xmyBpxOtEStflcyLFHC7VSXe/ZClTANpOEOdLCurBIH7i
 jEEi/1VUaZmjzaYrKQ93n4J+kTo7Ikc27HCFlaUIJR/yZgZFw1OjZiZymP9MjZCu1d72ac0jJOKMZbdmhcV/0ZlctKLKOs/GVeYqYM2l/D6QIkADUz6yU3CD


--Apple-Mail-3FFAB311-F41A-4B65-82E2-B42FF4D09E85
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Il giorno 3 dic 2021, alle ore 01:20, Giulio Benetti <giulio.benetti@benet=
tiengineering.com> ha scritto:
>=20
> =EF=BB=BFHi Rob, Jesse,
>=20
> On 28/11/21 17:43, Rob Herring wrote:
>=20
> [SNIP]
>=20
>>> diff --git a/arch/arm/boot/dts/imxrt1050.dtsi b/arch/arm/boot/dts/imxrt1=
050.dtsi
>>> new file mode 100644
>>> index 000000000000..35943a6896fa
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/imxrt1050.dtsi
>>> @@ -0,0 +1,165 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright (C) 2019
>>> + * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> + */
>>> +
>>> +#include "armv7-m.dtsi"
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/clock/imxrt1050-clock.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +
>>> +/ {
>>> +    #address-cells =3D <1>;
>>> +    #size-cells =3D <1>;
>>> +
>>> +    clocks {
>>> +        osc: osc {
>>> +            compatible =3D "fsl,imx-osc", "fixed-clock";
>> fsl,imx-osc is not documented. IMO, just drop it.
>=20
> Regarding this ^^^, you're right, so we avoid to add "fsl,imx-osc", but at=
 this point, does it make sense we create a patchset to remove it from the o=
ther .dts(i) files that use it? And same goes for "fsl,imx-ckil", "fsl,imx-c=
kih1", "fsl,imx-ckih2"?
>=20
> I see that those try to repeat the name of the node itself so they are use=
less. If you say so I send a patchset for that.

I=E2=80=99ve just made and sent such patchset:

https://lore.kernel.org/linux-arm-kernel/20211203004039.48752-1-giulio.benet=
ti@benettiengineering.com/T/#t

Best regards
Giulio

>=20
> Thank you
> Best regards
> --=20
> Giulio Benetti
> Benetti Engineering sas

--Apple-Mail-3FFAB311-F41A-4B65-82E2-B42FF4D09E85
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><blockquote type=3D"ci=
te">Il giorno 3 dic 2021, alle ore 01:20, Giulio Benetti &lt;giulio.benetti@=
benettiengineering.com&gt; ha scritto:<br><br></blockquote></div><blockquote=
 type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi Rob, Jesse,</span><br><spa=
n></span><br><span>On 28/11/21 17:43, Rob Herring wrote:</span><br><span></s=
pan><br><span>[SNIP]</span><br><span></span><br><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>diff --git a/arch/arm/boot/dts/imxrt1050.dtsi b=
/arch/arm/boot/dts/imxrt1050.dtsi</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>new file mode 100644</sp=
an><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>index 000000000000..35943a6896fa</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>--- /dev/nul=
l</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>+++ b/arch/arm/boot/dts/imxrt1050.dtsi</span><br></blockq=
uote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>=
@@ -0,0 +1,165 @@</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>+// SPDX-License-Identifier: (GPL-2.0+ O=
R MIT)</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockq=
uote type=3D"cite"><span>+/*</span><br></blockquote></blockquote><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>+ * Copyright (C) 2019</span>=
<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><span>+ * Author(s): Giulio Benetti &lt;giulio.benetti@benettiengineer=
ing.com&gt;</span><br></blockquote></blockquote><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><span>+ */</span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>+</span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+#i=
nclude "armv7-m.dtsi"</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>+#include &lt;dt-bindings/interrupt-c=
ontroller/arm-gic.h&gt;</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>+#include &lt;dt-bindings/clock/im=
xrt1050-clock.h&gt;</span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>+#include &lt;dt-bindings/gpio/gpio.h&=
gt;</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>+</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span>+/ {</span><br></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp; &n=
bsp;#address-cells =3D &lt;1&gt;;</span><br></blockquote></blockquote><block=
quote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp; &nbsp;#size-cel=
ls =3D &lt;1&gt;;</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>+</span><br></blockquote></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>+ &nbsp; &nbsp;clock=
s {</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>+ &nbsp; &nbsp; &nbsp; &nbsp;osc: osc {</span><br></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><s=
pan>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;compatible =3D "fsl,imx-osc",=
 "fixed-clock";</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><span>fsl,imx-osc is not documented. IMO, just drop it.</span><br></blockq=
uote><span></span><br><span>Regarding this ^^^, you're right, so we avoid to=
 add "fsl,imx-osc", but at this point, does it make sense we create a patchs=
et to remove it from the other .dts(i) files that use it? And same goes for "=
fsl,imx-ckil", "fsl,imx-ckih1", "fsl,imx-ckih2"?</span><br><span></span><br>=
<span>I see that those try to repeat the name of the node itself so they are=
 useless. If you say so I send a patchset for that.</span><br></div></blockq=
uote><div><br></div><div>I=E2=80=99ve just made and sent such patchset:</div=
><div><br></div><div><a href=3D"https://lore.kernel.org/linux-arm-kernel/202=
11203004039.48752-1-giulio.benetti@benettiengineering.com/T/#t">https://lore=
.kernel.org/linux-arm-kernel/20211203004039.48752-1-giulio.benetti@benettien=
gineering.com/T/#t</a></div><div><br></div><div>Best regards</div><div>Giuli=
o</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><span=
>Thank you</span><br><span>Best regards</span><br><span>-- </span><br><span>=
Giulio Benetti</span><br><span>Benetti Engineering sas</span><br></div></blo=
ckquote></body></html>=

--Apple-Mail-3FFAB311-F41A-4B65-82E2-B42FF4D09E85--
