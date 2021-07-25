Return-Path: <SRS0=Mshf=MR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F30AC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jul 2021 12:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4001B608FB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jul 2021 12:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4001B608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOUb9gq1YqakOZFzdALR5ilgYle8pZRBYSwneqVRXys=; b=bf7S2qwhBMkXOr
	Z7J47ClbUqCq5ZM90xrtpbxVLma7b6hcz86xrma8J5wr6jWwdZPC4Y3SYzOKY7Gf7c1Ul3Bjy2CCF
	MNjsP34ZpWR3QvACQThhpa0F15TBUsQ+yQxfD78SQgwXE5WuvJ1gYr0v0rA4GPeSObu3TIzN94LPj
	StYfJ+Fw2NwjUMrbm5EMJsepOPM/mv4AbHmJ28UiIYt13cBMKPIIcApDYYGRpmZjDGU+1PnNuRibD
	Y2JCtAilCA/3mWtaC8EMfpPjzIQ6pEnt1JmIPVQ9lf9nUOs3kSfdvbq7rKVIXBkN7LpoUy0IncUKT
	MuoNS38h3qG9/WeyKYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7cs3-008ahs-Ek; Sun, 25 Jul 2021 12:04:39 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7cs0-008agl-3g
 for linux-arm-kernel@lists.infradead.org; Sun, 25 Jul 2021 12:04:37 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 779d7b10-ed40-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 12:04:30 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B24D194B1A;
 Sun, 25 Jul 2021 14:04:43 +0200 (CEST)
Date: Sun, 25 Jul 2021 14:04:22 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, soc@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: simple: add some Logic
 Technologies and Multi-Inno panels
Message-ID: <YP1TRtiWkJDG76Fr@ravnborg.org>
References: <20210714045349.10963-1-o.rempel@pengutronix.de>
 <20210714045349.10963-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714045349.10963-2-o.rempel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_050436_325388_2A0E7893 
X-CRM114-Status: GOOD (  10.23  )
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
Message-ID: <20210725120422.9XPxw6NUpgDZo5BEORC-UVhav3c_fOP2wJnkn1pGH3Q@z>

SGkgT2xla3NpaiwKCk9uIFdlZCwgSnVsIDE0LCAyMDIxIGF0IDA2OjUzOjQ2QU0gKzAyMDAsIE9s
ZWtzaWogUmVtcGVsIHdyb3RlOgo+IEFkZCBMb2dpY3RlY2hubyBhbmQgTXVsdGktSW5ubyBwYW5l
bHM6Cj4gLSBMb2dpYyBUZWNobm9sb2dpZXMgTFRURDgwMHg0ODAgTDJSVCA3IiA4MDB4NDgwIFRG
VCBSZXNpc3RpdmUgVG91Y2ggTW9kdWxlCj4gLSBMb2dpYyBUZWNobm9sb2dpZXMgTFRURDgwMDQ4
MDA3MC1MNldILVJUIDfigJ0gODAweDQ4MCBURlQgUmVzaXN0aXZlIFRvdWNoIE1vZHVsZQo+IC0g
TXVsdGktSW5ubyBUZWNobm9sb2d5IENvLixMdGQgTUkxMDEwQUlULTFDUCAxMC4xIiAxMjgweDgw
MCBMVkRTIElQUyBDYXAgVG91Y2ggTW9kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWogUmVt
cGVsIDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT4KCkFkZGVkIHRvIGRybS1taXNjLW5leHQgd2l0
aCBSb2IncyBhY2suCgoJU2FtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
