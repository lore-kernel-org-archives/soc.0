Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039E3C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:14:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D5360F9C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 23:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3D5360F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqqPKYalD4F1uWo2rZQP8VpZN/oCqxHClSlj73eLgv0=; b=Zl7pZBCG5j886a
	xf4QEF7FR9GCg+Hk/e39LPXG/MDyW0Fa0NzbA9wDR7KIcPKXiBd00VL27VKA6IGTCkk9J179cDG+A
	Dpq21/5BF9ROICRXkXBZQH8xnh7kf+eE4WBbOQRmEOMgmBcpKZniVEtc3lobuhHwU+FatB7RV9wWk
	VDt+vDrEU8rNwraB/pEGWSy0KWv6y9K1QaV30OB6+3eZZ+a4Hs/fvMRVr59v6Cq/UiiF9yrJ7Wlzk
	mjSe/mKK9HYPRZihQJqs3IKoTr+3JDpid6cblvOiecI5f1mxBtnSsOhymwjiRunRlF1mfr54g6gGG
	7gpFQ3NuKZWLqto+a4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1memfa-00EkXy-Bt; Sun, 24 Oct 2021 23:12:50 +0000
Received: from smtpcmd11116.aruba.it ([62.149.156.116])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1memfV-00EkXF-9N
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 23:12:47 +0000
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id emfKmEfjAumo4emfLmfmvM; Mon, 25 Oct 2021 01:12:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635117160; bh=j96ao78HmlujpX6unhgccWbxzWEqZn6BPNaoxLrWHus=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=daAIf3QXH2JQFGjWAogfzLjHayK+JfpN9XGI7ohXoZDgifYq5FdVLRECuNKegsMDE
 QCENfUg9SqJfktPmeVfYsZIfLxUoYrRhd0AQD5Y121AUshpJZXh9ZEaXmwatUQldNi
 maxCnOCzF4vZ8xIqz6dBLrcvvKt77PvdD73OpkX4r5BH/anrTanrYLysmlZSQCoJpq
 Vq5hjE8Phef2u+gtIHNwr8pEdv2h1Zj3opffyeDVYEn6E47Fq6XbMFlrAEhFB2FVBG
 rAZCkWoAYnEzUZmnR8Ey9w7hKl+2bctvgxUhLlKzvVdlpoUuJAUkFgLabcnCRkilYa
 vgcZkGrx+UEiw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 00/13] This patchset aims to add initial support for the
 i.MXRT10xx family
Date: Mon, 25 Oct 2021 01:12:34 +0200
Message-ID: <01533F58-1A09-4C01-A5F7-85201BA39D11@benettiengineering.com>
References: <b7132b95-4a9f-db7c-6010-3f9df99a3087@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, NXP Linux Team <linux-imx@nxp.com>,
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
 Leonard Crestez <leonard.crestez@nxp.com>, b20788@freescale.com,
 Andy Duan <fugang.duan@nxp.com>, linux-clk <linux-clk@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
In-Reply-To: <b7132b95-4a9f-db7c-6010-3f9df99a3087@gmail.com>
To: Jesse Taube <mr.bossman075@gmail.com>
X-Mailer: iPhone Mail (18H17)
X-CMAE-Envelope: MS4wfAHL1PAEi5lW5RM2PHw3BuHcCgJ4pTmhoWiiFstJZ8Ev4b7kEXcoF6XasqgMiJ7k+05EmXjerjumXJQ/kqmxwXd79nFuArs+aqxyrc4s27tSletzXYR8
 d7d4nXGFsElHZcBAb8n39jPH8O9iSVV4Fhwnj0HsqfCMX9tknQNsd9eZHfxAFyKROb09AtReZyy5ktHYW+CCFDtcxQkmSld4ell9S3UpHW6J1E/l452PsroU
 Dgyzm36Vq5VvojCG7/GlwIal5cbzUEGDVvewPvdWWyxsBPKHDXPUVRSQalpK8BCcE4CZGdEARZEvigUtFzpw4pY86t5XV6US7/sHQW3nyM/CXfHb368d8Ujs
 vEWCv91KfndmBN0ulW6JJHLzzzCr9KFD6FaDu4FyBF3qljB1PpJRcjIFVlpG42jjIgftlttx9OnkgIs0JYCxUd2z5yPrjgz0FRgOoImKpIlCOZs2YDysRFNA
 2byfY7Z2dyvxPZsCBYwDLlh8byDD1ZdVeg8ghpvwzPZk0diyDEW1oBXEN7QfbBfc6u/iPEHaIvPQQ6tMXW7gcx194eB8eMQ1p9d8IgLzJznD24UHdZD9Oeqk
 MzOQ+fX6QzHNvcxLNstMbDhz5fSY9SeRmzs4ne4CuqUc/Gk4jThKpB/c97r16QZ3KO73cOq8SAQPy55jzApec1ok0OBEwVeFiOpor3bmD8QjkU8BllVRMZ84
 7/ABnfGZmBeTj63CihhpCNb6vDQrrDbdRpXyxRw31xgrChZKj5OJK6s0KyX15NyRunqc5W5xmXUsH8To5b38LASh9GQ/E3Nayid9BGXxJ13EfqTSByV6wRgd
 guATonnXs3aY2PRRAXGGr9NyS7i3Cim3O3O61eotDutjhQOB5QF7seP6hDdn6C8173rrEQf9a+Ac2DzOsqfFRPZbOlpv+V6y9EtwfHUsvbK+wj8oeb35u6Od
 b7HI7dclKaj4+nNAGgibEL5e4fDM26kTrtaQJAgbe4N4BlMT+HZDLAY7szksAygT3xocd2ukpeRVGqfkI1Eiqi3zB5Wx6SHgUoFqAXEnTOa5o3lgEcnkBW5H
 QqiE+43MsqfeVRgaxuOiKC1RDk0zzy+4v0RvUfZ20bnqCv9EOlmPMkHhv+W/7oc+G440g/pWBRhaE/4tmf1LBK4e/UOfOfQE79NFDr8Z8jNXHT1RFynkFde4
 R+h28VJqGF8J12FzUZ0dO5wPA2KK4+Vg/3rN5i3vIX2KIqozC1e8SoowVv3vHu+OPL9efsFf1PKdwxqfqHVegA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_161246_019472_22B7C6E8 
X-CRM114-Status: GOOD (  24.98  )
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
Message-ID: <20211024231234.CIiRyMoD5BLGUIyk6Jr8S3Vl8hxx7ZQtXLrEohFQnTM@z>

SGVsbG8gQXJuZCwgSmVzc2UsIEFsbCwKCkplc3NlIGFuZCBJIGhhdmUgYW5zd2VyZWQgdG9nZXRo
ZXIsIGJ1dCBJ4oCZdmUgbWlzc2VkIDEgcG9pbnQgYmVsb3cKCj4gSWwgZ2lvcm5vIDI1IG90dCAy
MDIxLCBhbGxlIG9yZSAwMDoyMSwgSmVzc2UgVGF1YmUgPG1yLmJvc3NtYW4wNzVAZ21haWwuY29t
PiBoYSBzY3JpdHRvOgo+IAo+IO+7v0hlbGxvIEFybmQsCj4gCj4gR2l1bGlvIGlzIGluIENDCj4g
Cj4+IE9uIDEwLzI0LzIxIDM6MzIgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+PiBPbiBTdW4s
IE9jdCAyNCwgMjAyMSBhdCA1OjQwIFBNIEplc3NlIFRhdWJlIDxtci5ib3NzbWFuMDc1QGdtYWls
LmNvbT4gd3JvdGU6Cj4+PiAKPj4+IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHRoZSBpLk1YUlQx
MHh4IFNvQyBmYW1pbHkKPj4+IHN0YXJ0aW5nIHdpdGggdGhlIGkuSU1YUlQxMDUwIFNvQy4KPj4+
IFRoaXMgcGF0Y2hzZXQgY29udGFpbnM6Cj4+PiAtIGkuTVhSVDEweHggZmFtaWx5IGluZnJhc3Ry
dWN0dXJlCj4+PiAtIGkuTVhSVDEwNTAgcGluY3RybCBkcml2ZXIgYWRhcHRpb24KPj4+IC0gaS5N
WFJUMTA1MCBjbG9jayBkcml2ZXIgYWRhcHRpb24KPj4+IC0gaS5NWFJUMTA1MCBzZC1jYXJkIGRy
aXZlciBhZGFwdGlvbgo+Pj4gLSBpLk1YUlQxMDUwIHVhcnQgZHJpdmVyIGFkYXB0aW9uCj4+PiAt
IGkuTVhSVDEwNTAtZXZrIGJhc2ljIHN1cHBvcnQKPj4gCj4+IENhbiB5b3UgZXhwYW5kIHRoZSBk
ZXNjcmlwdGlvbiBhIGJpdCBtb3JlIHNvIGl0IG1ha2VzIHNlbnNlIGFzIGEgY2hhbmdlbG9nCj4+
IHRleHQgZm9yIHRoZSBtZXJnZSBjb21taXQ/IEl0J3MgZmFpcmx5IHJhcmUgdGhlc2UgZGF5cyB0
aGF0IHdlIGFkZCBzdXBwb3J0IGZvciBhCj4+IE1NVS1sZXNzIHBsYXRmb3JtLCBzbyBpdCB3b3Vs
ZCBiZSBnb29kIGlmIHRoZSBpbnRyb2R1Y3RvcnkgdGV4dCBhbnN3ZXJzCj4+IHF1ZXN0aW9ucyBs
aWtlOgo+PiAKPj4gLSB3aGF0IGlzIHRoaXMgcGxhdGZvcm0gdXNlZCBmb3IsIGFuZCB3aGF0IGlz
IHRoZSBwdXJwb3NlIG9mIHJ1bm5pbmcgTGludXggb24gaXQKPj4gIGluIHBsYWNlIG9mIHRoZSB1
c3VhbCBSVE9TIHZhcmlhbnRzPwoKSeKAmXZlIGZvcmdvdHRlbiB0byBtZW50aW9uIHRoZSByZWFz
b24gb2YgTGludXggaGVyZSBiZWZvcmUgd2l0aCBKZXNzZS4KSSB0aGluayB0aGF0IHNvbWVvbmUg
Y291bGQgZmluZCBhbiBlYXNpZXIgcmVhZHkgdG8gZ28gZW52aXJvbm1lbnQgd2l0aCBMaW51eChh
bmQgQnVpbGRyb290IGFzIGJ1aWxkIHN5c3RlbSksIG5vdCB0aGF0IG11Y2ggZm9yIGdyYXBoaWNz
IGJ1dCBmb3IgYWxsIHRoZSB1dGlsaXRpZXMgc3RhcnRpbmcgZnJvbSBiYXNoLgpHcmFwaGljcyBj
YW4gYW55d2F5IGJlbmVmaXQgZnJvbSBxdCBsaXRlIG9yIG90aGVyIGxpZ2h0d2VpZ2h0IGxpYnJh
cnkgc3RhdGljYWxseSBidWlsdC4KClRoaXMgU29DIGlzIHVzZWQgYXJvdW5kIHRoZSB3b3JsZCB3
aXRoIE1DVVhQUkVTU08gYW5kIGl04oCZcyB0aGUgbnhwIGFuc3dlciB0byBzdG0zMmY3IG1vcmUg
b3IgbGVzcy4KCkEgcHJpdmF0ZSBjb21wYW55IGFscmVhZHkgcHJvdmlkZSBhIGNvbW1lcmNpYWwg
TGludXggNC41IEJTUCBmb3IgaXQod2XigJlyZSByZXdyaXR0ZW4gZnJvbSBzY3JhdGNoKSwgc28g
SSB0aGluayB0aGlzIG1lYW5zIHRoYXQgc29tZW9uZSBpcyBpbnRlcmVzdGVkLgoKPj4gCj4+IC0g
YXJlIHlvdSBkb2luZyB0aGlzIGp1c3QgZm9yIGZ1biwgb3IgYXJlIHRoZXJlIGFueSBjb21tZXJj
aWFsIHVzZSBjYXNlcz8KPiAKPiBUaGUgcHVycG9zZSBvZiB0aGlzIGlzIGZvciBsZWFybmluZyBh
bmQgZnVuLCBhcyBmYXIgYXMgd2Uga25vdyB0aGVyZSBhcmUgbm8KPiBjb21tZXJjaWFsIHVzZSBj
YXNlcywgYnV0IHdlIGhvcGUgdGhlcmUgd2lsbCBiZS4KCkF0IHRoZSBtb21lbnQgdGhlcmUgaXMg
bm8gcmVxdWVzdCwgYnV0IGJlY2F1c2Ugb2YgdXBzdHJlYW1pbmcgbWF5YmUgdGhlcmUgY291bGQg
YmUuCgo+IAo+PiAtIHdoYXQgYXJlIHRoZSBtaW5pbXVtIGFuZCBtYXhpbXVtIG1lbW9yeSBjb25m
aWd1cmF0aW9ucyB0aGlzIGhhcwo+PiAgYmVlbiB0ZXN0ZWQgd2l0aD8KPiAKPiBXZSBib3RoIGhh
dmUgb25seSB0ZXN0ZWQgd2l0aCAzMk1CIG9mIHJhbSBvbiBpLk1YUlQxMDUwLzYwLWV2ay4KClRo
b3NlIDIgU29DcyBjYW4gZXhwYW5kIHVwIHRvIDY0TUIuCgo+IAo+PiAtIHdoYXQgdXNlciBzcGFj
ZSBhcmUgeW91IHRlc3Rpbmcgd2l0aDogYW55IHBhcnRpY3VsYXIgZGlzdHJvIHRoYXQgc3VwcG9y
dHMKPj4gIHRoaXMgcGxhdGZvcm0sIGFuZCBkbyB5b3UgcnVuIGVsZi1mZHBpYyBvciBmbGF0IGJp
bmFyaWVzLgo+IAo+IFdlIGFyZSB1c2luZyBCdWlsZHJvb3RbMV0gYW5kIHRoYXQgb25seSB1c2Vz
IGZsYXQgYmluYXJpZXMuCj4gaS5NWFJUMTA1MC8yMCBoYXZlIGFscmVhZHkgYmVlbiB1cC1zdHJl
YW1lZCB0byBVLUJvb3RbMl0uCj4gCj4+IC0gYXJlIHlvdSBwbGFubmluZyB0byBhbHNvIHN1cHBv
cnQgdGhlIG5ld2VyIGkuTVhSVDExeHggb3IKPj4gIENvcnRleC1SIGJhc2VkIGRlc2lnbnMgbGlr
ZSB0aGUgUzMyUz8KPiAKPiBXZSBwbGFuIHRvIHN1cHBvcnQgdGhlIGkuTVhSVDExeHgsIGJ1dCB1
bnN1cmUgYWJvdXQgdGhlIFMzMngsIGl0IGRlcGVuZHMgCj4gb24gdGhlIGludGVyZXN0LiAKPiAK
Pj4gCj4+ICAgICAgIEFybmQKPj4gCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vTXItQm9zc21h
bi9pbXhydC1saW51eC1idWlsZHJvb3QuZ2l0Cj4gWzJdOiBodHRwczovL3NvdXJjZS5kZW54LmRl
L3UtYm9vdC91LWJvb3QvLS9ibG9iL21hc3Rlci9jb25maWdzL2lteHJ0MTA1MC1ldmtfZGVmY29u
ZmlnCj4gCj4gVGhhbmsgeW91LCAKPiBKZXNzZSBUYXViZS4KClRoZSByZXN0IGlzIGFscmVhZHkg
YW5zd2VyZWQKCkJlc3QgcmVnYXJkcwpHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5n
IHNhcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
