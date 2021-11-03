Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3C5C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 02:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BEC60F39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 02:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98BEC60F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SsF3wBjAzKYGiAoBY7F3t+AGX8xtWhqUwEsXCSIE51U=; b=bPIT0Xo7CWfN7H
	Yk6LN7lHkC8gkGFaTOTWBc3gV6mbXTx5ImZR74flNDzx9HD2IQmYGRyNRBWhfR4hkgaDjiH/+rnpF
	G3+ar0rtrwutNzdmQeJhXwuLRKua2tsZyDP4qjqeUz5dJsTKlvMfH3DpK1D8N77R2uj8MgesUQBRu
	05kUx7mxlL9SqCDMAeLPXWZVrsGFyjrH+NxcF3EqaSVu63gV7BFOuDE6SaA7EomNZJlI7zrDmpMkH
	LQSmW/0HyhZjcYP08DMoX2fSEpK7utDdFsf8V9nSul3Xgyf1BV9KYQV7/Mh8IeC1Y4OKY2AiSEue/
	nIQpTUOhgFPFz/33o6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi6Ko-003uYx-G3; Wed, 03 Nov 2021 02:49:06 +0000
Received: from smtpcmd11117.aruba.it ([62.149.156.117])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi6Kk-003uY9-O2
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 02:49:04 +0000
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id i6KdmWeslumo4i6KdmXOCm; Wed, 03 Nov 2021 03:48:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635907738; bh=vn0en0EIlHgkPwPZZERx136vgq1/nmIMJ6ZT4dkZqag=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=J9naTf+IAohR2xOuGFgEzMfooC6CT8nvH3rCcxEWgk4ynOkf9Na/5Aqb8CB1TYo6O
 E72mOAH0K6Haxm+L3WXrEe/q9WMjDSlZd5pngARGRVwsq1+tUy5onszIqxfCDTHDSw
 FJqY5awdjZXgfm/Z33r99rSTvYbfrSaei0yvkgo895UNDUgzzsfwvlsL4GZT5zf8g4
 mlgBpKAQEB6xb/Nih89L56sQBD2benwgBCFHMJXdhbWd1w9XRNB2i+f+KJ5UaLAXax
 xyAM63MAPZlAmH/xCTEiZZWeY0G7t6TrNo2hUg29dncGJPIvgBy6Z765r06VGFHqS3
 /ZU34wbBbftfA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Date: Wed, 3 Nov 2021 03:48:54 +0100
Message-ID: <D0A3E11F-FEDE-4B2D-90AB-63DFC245A935@benettiengineering.com>
References: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Stefan Agner <stefan@agner.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 SoC Team <soc@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Anson Huang <b20788@freescale.com>, Fugang Duan <fugang.duan@nxp.com>,
 linux-clk <linux-clk@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
In-Reply-To: <CAL_JsqJR6EfDsmwPmXxgdaC1GB7CLGYpjmDnOkD_f53Frsq6LA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfATmIMv5GA3j34nA+iOgc1h+7L3tNW3abl9oCE6PZB8OMXI5H3mb85Frc03sGYy21FlO+oJkV4yTBbwgW5Rj/0du+RvtJQeN4d3pTWoUGmPhXXFYvLcV
 QNuPaJZ09aPj0+mshEem7c3H/dDtmBF6Js+GbUpl3X77ZVu54p7RysYHkjD72LZmj1H9nrKMau+2FU6gAH8OfwkJcqu+K/QuRnCIGQyGPr3XRSCMWIAeXcnh
 14cBS5S+yv55Rx3kGkl8t/GASJe4FVaWXcwh2TmSlklGOJv0BnitVeN15pb+g3w02oFJrUgKwPJ60fOGTuEBSmuaWhDSUp0BnITKWVtU8NWjCdg22E/rK3ua
 UvuthcK4Gt+pMHdeNuelu7OQNeUa4osFW/xmS2SqnXAjQ/zXPIoKDZ9wYTW69+lVlUjcEQaQSIL5cDlAWhgyLYe58s0lVB+PUteYTjf5XPopnlNbF4BlhSUn
 1703ZYebBfSnDYcMuwywTgcke/l6oZOuiSXUAER9Kw+NQDUTm6vTA1zd63V6/2mI8V6fIuErDfUgGhwidKoWGZgy8w0lMux5lnPF152l3b+t+PRXsgoo8Fup
 vyE5oPOG87RvxafyxS+PGYtiDRSgb5g6gBK+6HKCBnCITIepAP0MxaYELLdoZIxHd2jQNXlyEXbPoapsLfCN839NHGj5xtHTF+RdCX6xRJLv7QbeBGv2lxdk
 WQuMJJl1glCO71l/9HImQMgssA4qHKsCwrUS4eVH4UwdhuKJRRfzXYZJNepCANMb5jUUomkTVI3BMVMYPLFcPn2lylrtW6uuvCzwHaPbLJuHEchajyGi9mPy
 cNs/j1wljxUbrkXF2DSbjxuGxED1hrUDrV4auoDE5lUYgSroodiTneWziQtrRVB/JzYl4C6iYazCH18QbLDLZc0W24SBjADnoy2c3JaRoN05Me4ZYOFsc4Lp
 Rc/MtcuLY1/6kPE7+x4/Pu0oLxAPRi9gvMjOAn+TcU4p3/lAW2Cj8/Kzy9ZtRUlfltDpjFZJDqdxAgCh7oCj9sIreifIVrSwfCx6JcENijeCT6gpQ4OzTaxq
 mwcnYVUpvxOA21nMdUUvMEJlVoadyglqlr9tgcp/tZNlXbX2jPakmS1Bx/8Q/gOFJTP6kTQF5NkXBVxbUWxgSoRnllcDGy2LlCt2WmbbdKWGh7d8jt98gwJD
 czQA9XU4BZVnndLpD6YTF4YbKlfBqXsPIzN57bT3ahyvfyxxMEVyQ+no+RY503EiVcfZf3vMJa6jb/9lw3xxrA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_194903_118630_1E8759CF 
X-CRM114-Status: GOOD (  15.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211103024854.aLr2eEOu8x-c1aAfB96VLGkHvnNSbb0d7mT75HfWwoo@z>

SGVsbG8gUm9iLCBKZXNzZSwgQWxsLAoKPiBJbCBnaW9ybm8gMyBub3YgMjAyMSwgYWxsZSBvcmUg
MDE6NDksIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IGhhIHNjcml0dG86Cj4gCj4g77u/
T24gTW9uLCBOb3YgMSwgMjAyMSBhdCA2OjM0IFBNIEplc3NlIFRhdWJlIDxtci5ib3NzbWFuMDc1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4+IAo+PiAKPj4gCj4+PiBPbiAxMS8xLzIxIDE2OjEzLCBSb2Ig
SGVycmluZyB3cm90ZToKPj4+IE9uIFN1biwgT2N0IDI0LCAyMDIxIGF0IDExOjQwOjIyQU0gLTA0
MDAsIEplc3NlIFRhdWJlIHdyb3RlOgo+Pj4+IEFkZCBpLk1YUlQgZG9jdW1lbnRhdGlvbiBmb3Ig
Y29tcGF0aWJsZSBzdHJpbmcuCj4+Pj4gCj4+Pj4gQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEplc3Nl
IFRhdWJlIDxNci5Cb3NzbWFuMDc1QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2ZzbC1scHVhcnQueWFtbCB8IDEgKwo+Pj4+
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2ZzbC1scHVhcnQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvZnNsLWxwdWFydC55YW1s
Cj4+Pj4gaW5kZXggYTkwYzk3MWI0ZjFmLi40YjQzNDBkZWYyYWEgMTAwNjQ0Cj4+Pj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9mc2wtbHB1YXJ0LnlhbWwK
Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2ZzbC1s
cHVhcnQueWFtbAo+Pj4+IEBAIC0yMSw2ICsyMSw3IEBAIHByb3BlcnRpZXM6Cj4+Pj4gICAgICAg
ICAgIC0gZnNsLGxzMTAyOGEtbHB1YXJ0Cj4+Pj4gICAgICAgICAgIC0gZnNsLGlteDd1bHAtbHB1
YXJ0Cj4+Pj4gICAgICAgICAgIC0gZnNsLGlteDhxbS1scHVhcnQKPj4+PiArICAgICAgICAgIC0g
ZnNsLGlteHJ0LWxwdWFydAo+Pj4gCj4+PiBBY3R1YWxseSwgJ3J0JyBpcyBub3QgYSBzaW5nbGUg
cGFydCBpcyBpdD8gSWYgdGhlIHZhcmlhdGlvbnMgYXJlIHNhbWUKPj4+IGRpZSwgYnV0IGZ1c2Vk
IG9mZiB0aGVuIG5vIG5lZWQgdG8gZGlzdGluZ3Vpc2guIE90aGVyd2lzZSwgdGhlc2Ugc2hvdWxk
Cj4+PiBiZSBTb0Mgc3BlY2lmaWMuCj4+PiAKPj4gSSBkb24ndCBleGFjdGx5IGtub3cgd2hhdCAi
YnV0IGZ1c2VkIG9mZiIgbWVhbnMgSSB3b3VsZCBhc3N1bWUKPj4gZGlzY29ubmVjdGVkIGJ1dCBv
bi1kaWU/Cj4gCj4gUmlnaHQuIE9yIG5vdCBwaW5uZWQgb3V0IGlzIGFub3RoZXIgcG9zc2liaWxp
dHkuCj4gCj4+IFRoZSBpbXhydHh4eCBpcyBhIHNlcmllcyB0aGF0IGhhcyB0aGUgc2FtZSBVQVJU
Cj4+IGNvbnRyb2xsZXIgYWNyb3NzIHRoZW0uIFNob3VsZCBJIGFkZCBBQ0s/Cj4gCj4gTG9va2lu
ZyBhdCB0aGUgZXJyYXRhIGRvY3MgYnJpZWZseSwgdGhlcmUncyBhdCBsZWFzdCAyIGRpZSBhcyBz
b21lIG9mCj4gdGhlIGVycmF0YSBkb2NzIGdpdmUgdGhlIG1hc2sgaWQuIFNvIHRoZXkgYXJlbid0
IG5lY2Vzc2FyaWx5ICd0aGUKPiBzYW1lJy4KClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcsIHdl4oCZ
dmUgbWlzc2VkIHRoaXMgcGFydGljdWxhci4KCj4gWW91IHdhbnQgdGhlIGNvbXBhdGlibGUgc3Ry
aW5ncyB0byBiZSBzcGVjaWZpYyBlbm91Z2ggdG8gaGFuZGxlCj4gYW55IGRpZmZlcmVuY2VzIG9y
IGVycmF0YS4gSWYgeW91IG9ubHkgY2FyZSBhYm91dCB0aGUgaW14cnQxMDUwLCB0aGVuCj4gSSdk
IGp1c3QgdXNlIHRoYXQgYW5kIG1vdmUgb24uCgpXZSBwbGFuIHRvIGFkZCBmcm9tIGlteHJ0MTAy
MCB0byBpbXhydDExNzAgYW5kIGV2ZW50dWFsIG5ldyBTb0MsIHNvIHdlIGRlZmluaXRlbHkgbmVl
ZCBzZXBhcmF0ZQouY29tcGF0aWJsZSBzdHJpbmdzLgoKQEplc3NlLCBjYW4geW91IHBsZWFzZSB1
cGRhdGUgd2l0aCDigJhmc2wsaW14cnQxMDUw4oCdPwoKPiBPdGhlcndpc2UsIG1heWJlIHNvbWVv
bmUgZnJvbSBOWFAgd2FudHMKPiB0byBjb21tZW50PwoKQW55IE5YUCBjb21tZW50IGlzIHdlbGNv
bWUhCgpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBlbmdpbmVlcmluZyBzYXMK
Cj4gCj4gUm9iCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYXJtLWtlcm5lbAo=
