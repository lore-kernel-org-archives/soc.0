Return-Path: <SRS0=ZqES=PX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4F1C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 02:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B178604AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Nov 2021 02:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B178604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NR9CKKH314BqrHl+kDqKX6YnHXU5t0lfKXdYWjz0L58=; b=yoFCgvzJ9fNbH5
	ZDsvE1a6LKJDwbwo8uMXd7dFJs552LQnCj4lNmBvxnpOAB+cqxDmDWtj+JGVgXpu9JwXoMLeJ97mm
	rA426iSkwGX3eL8uCzHGRmgEkE5tW0BUj/HNZG2KmvEbgO4x5fsg4l9QkgmYZCX5esm/cQjbxoEdu
	BYGFwUDJo4tpOPh06hpNSLJi98XQgLfE+Sfln3ejC86TrFIHdgiXo77mMOnUKnqJ4AJ4j2SrYuwFL
	SCXek/mHYDAIRQLuZSEfbRm0rE8ccButQiZ7wWyLgzGZQt4g9rIUPOsZKKeP/E/R1akptmJq9sXRD
	igxCPUuocBpEPzSJz7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miSWc-007cSa-No; Thu, 04 Nov 2021 02:30:46 +0000
Received: from smtpcmd11116.aruba.it ([62.149.156.116])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miSWY-007cR6-IM
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Nov 2021 02:30:44 +0000
Received: from smtpclient.apple ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPA
 id iSWPmxR5yumo4iSWQmmgHU; Thu, 04 Nov 2021 03:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635993037; bh=DZRFcy1A7pDPfjI/xc1yZ9deWpS/ap+fHvhGYQj6qt8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=N8Q8E/6Lo/V5C07x9Zz6934M8WwsfhWu8eM5yC4g709131ZDfKQ+D2c5MBrLa7p8x
 ru3wUQY9WIsXCbt/L2HiBHbiQGWmNkrQ2mWW0vwk8VXfTuQrwLsgXeT195gWsUWpov
 p5zFaVPIfEUSAGvculvT1gtSBlOeQk96cGl9ilrpLS2B8aF1nxxbK01xJlW+7xnLOT
 2UPvC5XV3ecGPXATf3UDklKW0SAkWIVa3mZKJ1keCBTn8Ps60mWQzWRHT+8F3Ky78r
 pA6IcEVkF4LDaFay0QoPvnCvQQjDNS6/yFtI72vD1ggnsBccLyiEgan2HHuiryO3cT
 AVHBkNzusU5dQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
Date: Thu, 4 Nov 2021 03:30:33 +0100
Message-ID: <B67A91BD-DAE9-468B-8731-251DE86E6B5B@benettiengineering.com>
References: <YYMx28VvhR7nvMlt@robh.at.kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dong Aisheng <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Abel Vesa <abel.vesa@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-serial@vger.kernel.org
In-Reply-To: <YYMx28VvhR7nvMlt@robh.at.kernel.org>
To: Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfA6GKfpXsRSNdwkIFTYQmUTZuqvvSqJg+QZ+U7tg2NH81o4pATFmJwAt9hr+3r2mNiS/sSK61vhtevF2cYqatJs6yFEDZMD5XAiD/Unil39uyjcDlR+E
 BcLXaIVZu4wKmq7xHmquyZQ9nQ3yxwcQ9iSgSki4StzrrvVTODPwjlAoDCbWXg3JeXCnJwf3N31U3quzLH0FFn7keK841utBPTSj8wFLVizEXBcybktsurWu
 vSAWrJVMfzQJqsZjAI+23fH9DD1GDdIZHmy8iAaNO/xA2EsVETe3uYkP9zIQ/2BrIcFaspiY7pBtb7q/CxnBA6dW4FakqGWyck2+HEEgVE6IyxDF4EA5AgX4
 vRQ4K7lOSHYLeJzs/ufxTJ/mMseghKr4wcjElkIZ7eP2XiQdLMNJJVZo0/OefdLTDhZY1+/rnybjvoSWOVgxCGmHfL9yn8FTO9pUA5hNE6JPVQ2MDMweeWb0
 G+5dsKEqJMQ4Mum9W+ibAj27IXt7E1u94i+Saple09dGbLXkIYWuDasXHmdEJdJobZ0xw4TF993iGYYhmRF1XYqJ9EfAU2t+X1Zrhw8KR7r2+1zASXyJhIyM
 vFn0oMrkO3YrgpxLciN1aigouwRBienWmrH22H404ZC2j5dCWnGRWg81fZE/F3hTFmCade+L94a9w45sR8gUGR6zdYeYndCEy9mlCsPRM0FoMiHqmoquhS/4
 7H1mmZz/dkqjG0dTNCLwDTR5d36gxqYxBWJb7N4W16x9E3tpaIxefOBUddegq0TPjAOla3W5UsdCMojSjykEsi4aOj57KIpNDgE7kMNRSsU3F37BESUaPTh9
 K3NgAhha3vddkCcY3pZ1YQ0QdxIrxSxM3K1ghN1U0pGG7/1T2cJ7Llfyva+k7TeMnDBBs0OV4f27BaCakDrK0CxFN1WjJmWUvm2+dBfQzwlxEANSxS9Urs3E
 RMhlMRxuU/4Ua8NvOM98GwPGVJF0No5AZb+M3grJE22WMJIFMw9RfciVdeleM15p9AcbsN6JdtHOaELVhDCxubtWKXnENjFT/Yg+Ju2qq6LUk0KtwtBnQr8N
 BCSy73MRVwLhTUucDQcoIUon2spbaJDehjTz12VXFJ+PYw7RSXKGvdT/t3XmqQiiXvoRt71Z4lN5yuyulmkB5laNulworHZJU94=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_193042_806972_A9226AFE 
X-CRM114-Status: GOOD (  19.33  )
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
Message-ID: <20211104023033.7io2t3Du9ooBS4D3hRsD1h1-UFV51osHpLK4cpFlqdE@z>

SGVsbG8gUm9iLCBKZXNzZSwgQWxsLAoKPiBJbCBnaW9ybm8gNCBub3YgMjAyMSwgYWxsZSBvcmUg
MDI6MDUsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IGhhIHNjcml0dG86Cj4gCj4g77u/
T24gV2VkLCBOb3YgMDMsIDIwMjEgYXQgMTI6MzA6MTdBTSArMDEwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4+IEhpIEZhYmlvLCBKZXNzZSwgQWxsLAo+PiAKPj4+IE9uIDExLzMvMjEgMTI6MjUg
QU0sIEplc3NlIFRhdWJlIHdyb3RlOgo+Pj4gCj4+PiAKPj4+IE9uIDExLzIvMjEgMTk6MTcsIEZh
YmlvIEVzdGV2YW0gd3JvdGU6Cj4+Pj4gT24gVHVlLCBOb3YgMiwgMjAyMSBhdCA3OjU3IFBNIEpl
c3NlIFRhdWJlIDxtci5ib3NzbWFuMDc1QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gCj4+Pj4+ICAg
c3RhdGljIHN0cnVjdCBlc2RoY19zb2NfZGF0YSB1c2RoY19pbXg4cXhwX2RhdGEgPSB7Cj4+Pj4+
ICAgICAgICAgIC5mbGFncyA9IEVTREhDX0ZMQUdfVVNESEMgfCBFU0RIQ19GTEFHX1NURF9UVU5J
TkcKPj4+Pj4gQEAgLTM1Nyw2ICszNjMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBpbXhfZXNkaGNfZHRfaWRzW10gPSB7Cj4+Pj4+ICAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAiZnNsLGlteDd1bHAtdXNkaGMiLCAuZGF0YSA9ICZ1c2RoY19pbXg3dWxwX2RhdGEsIH0sCj4+
Pj4+ICAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtdXNkaGMiLCAuZGF0YSA9
ICZ1c2RoY19pbXg4cXhwX2RhdGEsIH0sCj4+Pj4+ICAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
ZnNsLGlteDhtbS11c2RoYyIsIC5kYXRhID0gJnVzZGhjX2lteDhtbV9kYXRhLCB9LAo+Pj4+PiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGlteHJ0LXVzZGhjIiwgLmRhdGEgPSAmdXNkaGNf
aW14cnRfZGF0YSwgfSwKPj4+PiAKPj4+PiBJIHRob3VnaHQgUm9iIHN1Z2dlc3RlZCB0byB1c2Ug
dGhlIFNvQyBuYW1lLCBzbyB0aGlzIHdvdWxkIGJlOgo+Pj4+IAo+Pj4gVWggaSB0aGluayB0aGF0
IG1heSBoYXZlIGJlZW4gZm9yIHRoZSBVQVJULgo+Pj4+IHsgLmNvbXBhdGlibGUgPSAiZnNsLGlt
eHJ0MTA1MC11c2RoYyIsIC5kYXRhID0gJnVzZGhjX2lteHJ0MTA1MF9kYXRhLCB9LAo+Pj4+IAo+
Pj4+IFRoZSBzYW1lIGFwcGxpZXMgdG8gdGhlIG90aGVyIGJpbmRpbmdzIGluIHRoZSBzZXJpZXMu
Cj4+Pj4gCj4+Pj4gVGhpcyB3YXkgaXQgd291bGQgYmUgcG9zc2libGUgdG8gZGlmZmVyZW50aWF0
ZSBiZXR3ZWVuIGZ1dHVyZQo+Pj4+IHN1cHBvcnRlZCBpLk1YIFJUIGRldmljZXMuCj4+Pj4gCj4+
PiBUaGlzIG1ha2VzIHNlbnNlIHdpbGwgZG8gaW4gVjMuCj4+PiAKPj4gCj4+IElmIHdlIGFkZCBl
dmVyeSBTb0Mgd2Ugd2lsbCBlbmQgdXAgaGF2aW5nIGEgbG9uZyBsaXN0IGZvciBldmVyeSBkZXZp
Y2UKPj4gZHJpdmVyLiBBdCB0aGUgbW9tZW50IGl0IHdvdWxkIGJlIDcgcGFydHM6Cj4+IDEpIGlt
eHJ0MTAyMAo+PiAyKSBpbXhydDEwMjQKPj4gLgo+PiAuCj4+IC4KPj4gNykgaW14cnQxMTcwCj4g
Cj4gWW91IGRvbid0IG5lZWQgYSBkcml2ZXIgdXBkYXRlIGlmIHlvdSB1c2UgYSBmYWxsYmFjay4g
V2hlbiB5b3UgYWRkIAo+IHRoZSAybmQgY2hpcCwgaWYgeW91IHRoaW5rIGl0IGlzICd0aGUgc2Ft
ZScsIHRoZW4geW91IGRvOgo+IAo+IGNvbXBhdGlibGUgPSAiZnNsLGlteHJ0MTAyNC11c2RoYyIs
ICJmc2wsaW14cnQxMDUwLXVzZGhjIjsKPiAKPiBUaGF0IHJlcXVpcmVzIG5vIGRyaXZlciB1cGRh
dGUgdW50aWwgdGhlIGRyaXZlciBuZWVkcyB0byBoYW5kbGUgc29tZSAKPiBkaWZmZXJlbmNlLiBB
bmQgd2hlbiB0aGVyZSBpcyBhIGRpZmZlcmVuY2UsIHlvdSBkb24ndCBuZWVkIGEgRFQgdXBkYXRl
LgoKVGhpcyBzb2x1dGlvbiBpcyBwcmV0dHkgZmluZSwgd2XigJlyZSBnb2luZyB3aXRoIHRoYXQg
dGhlbiwgZm9yIHRoaXMgYW5kIGV2ZXJ5IGRyaXZlciBpbnZvbHZlZC4KClRoYW5rIHlvdSBmb3Ig
cG9pbnRpbmcgdXMuCgpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVl
cmluZyBzYXMKCj4gCj4gWW91IGNvdWxkIG1ha2UgImZzbCxpbXhydC11c2RoYyIgdGhlIGZhbGxi
YWNrIGZyb20gdGhlIHN0YXJ0IGlmIHlvdSBhcmUgCj4gYWR2ZXJzZSB0byB0aGUgZmlyc3Qgd2F5
Lgo+IAo+IFJvYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwK
