Return-Path: <SRS0=jErW=PC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F1CC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Oct 2021 16:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F3DC61108
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Oct 2021 16:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F3DC61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpMTTH1G1Bov6EmscAzURX1Pf1UTvfhaiTe1iPxL60A=; b=331nsdozJSS+RQ
	/aX8iRcayfDgth6JwUIAsH0WrbU2bqIGjIGVimnmBuyqOUSnh4hu6zZdl+VTCmBN+QBxlmZqzcAHI
	JGOZZKmAJneE1Ig2n5xsSSvoC8EBj8xMg42MpBSgpxY+ykrOLJSTqBXwC8pKxEkaAdZeSUT6FPJh/
	nwomWlSnVvj2fEfthRTFDhSmlbJCQgWwQG/v0ysFXPpovU13fbFicQyaBOQ4V4SLeyLM2s2VAHVcA
	euKa61KqfPP4KCu9jGF1NbyIXb1pFkThuQEzw7UoEi8kyxoVZtYEVaInBTQAswSa8RPRLSthPurV+
	kmp7m+k5rueZ2umb4cyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb3se-003t3p-T4; Thu, 14 Oct 2021 16:46:57 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb3sZ-003t2R-VT
 for linux-arm-kernel@lists.infradead.org; Thu, 14 Oct 2021 16:46:53 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so9087517otb.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 14 Oct 2021 09:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ujHcRvCirmqYyP/G9OIlII3v2dI92/qrzyNIDCv4hDA=;
 b=TGzqNzRhyamBElmQEdNAAXJfhwyc6/ywLB0WPwNiKhhfC1YBv9tfH7ZWSFpP2O+KqS
 oebJE8mkyJAUoROxyWRveA3MKC278pEf5Wo5zbdSYDtg4mR7eTzfAIqc1y6CYiFBOnek
 1MgwivGhb6yH/LdeQPCrQv4MIEOBO5O6G26WS2g1jjh2jqO626reL8A0pKIN/f3z7P4R
 a8mjCFGGXwWSHdM++iynrJWxGKwuJMLInT5lu9Tq4nVg8vMVpt3Y6GHK72hbojp2l8z7
 3+wkV5J1mZ9ZjNWtOFHC3vIHHBn4Ma9pMFkEukJOG0T16WerZpk124q9xCxG2dpG1mbz
 7KrA==
X-Gm-Message-State: AOAM530p8KPo1FGdpvfB1e9VIMg8eO8ma6oDZicw8SPFhRpTT4NR+lMK
 gYVM5hsx4OeObvJ99/nEiA==
X-Google-Smtp-Source: ABdhPJxVtfNRxyb4DCtNbXuq+R80ABq48UJGCYahUiRCZ8f5QF2NeHuamoz+are7uUC04PrCG01Myw==
X-Received: by 2002:a9d:4616:: with SMTP id y22mr3493410ote.215.1634230010558; 
 Thu, 14 Oct 2021 09:46:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j6sm532430oot.18.2021.10.14.09.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:46:50 -0700 (PDT)
Received: (nullmailer pid 3518479 invoked by uid 1000);
 Thu, 14 Oct 2021 16:46:48 -0000
Date: Thu, 14 Oct 2021 11:46:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 mika.westerberg@linux.intel.com, p.zabel@pengutronix.de, arnd@arndb.de,
 olof@lixom.net, soc@kernel.org, dinguyen@kernel.org, p.yadav@ti.com,
 Tudor.Ambarus@microchip.com, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com, sre@kernel.org,
 thunder.leizhen@huawei.com, Jonathan.Cameron@huawei.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ka@semihalf.com, tn@semihalf.com, jam@semihalf.com, amstan@google.com
Subject: Re: [PATCH v2 2/4] dt-bindings: add bus number property
Message-ID: <YWhe+NfiY0l0ILrA@robh.at.kernel.org>
References: <20211005143748.2471647-1-pan@semihalf.com>
 <20211005143746.xE5rCkt-P_XlNkn9bJ8ZqYPY4nQQ7doqzSd4FrAlICY@z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211005143746.xE5rCkt-P_XlNkn9bJ8ZqYPY4nQQ7doqzSd4FrAlICY@z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_094652_043515_2EE5866E 
X-CRM114-Status: GOOD (  11.08  )
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
Message-ID: <20211014164648.M1uKnzcw4t5Jv7OPB9trVkB5i-AW_cXSVgUekIUW13c@z>

T24gVHVlLCBPY3QgMDUsIDIwMjEgYXQgMDQ6Mzc6NDZQTSArMDIwMCwgUGF3ZcWCIEFuaWtpZWwg
d3JvdGU6Cj4gT24gU29DRlBHQSBzeXN0ZW1zLCBpdCdzIGRlc2lyZWFibGUgdG8gaGF2ZSBmaXhl
ZCBudW1iZXJpbmcgZm9yCj4gaTJjIGJ1c3Nlcywgd2hpbGUgYmVpbmcgYWJsZSB0byBlbmFibGUv
ZGlzYWJsZSB0aGVtIChlLmcuIGhhdmUgaTJjMQo+IGJlIG1hcHBlZCB0byAvZGV2L2kyYy0xLCBl
dmVuIHRob3VnaCBpMmMwIGlzIGRpc2FibGVkKS4gVGhpcyBjYW4gYWxzbwo+IGJlIGFjaGlldmVk
IHVzaW5nIGRldmljZXRyZWUgYWxpYXNlcyAoc2VlIGkyY19hZGRfYWRhcHRlcikuIEhvd2V2ZXIs
Cj4gaGF2aW5nIHRoZSBkcml2ZXIgYmUgc2VsZi1jb250YWluZWQgd2l0aG91dCByZWx5aW5nIG9u
IGFsaWFzZXMgaXMgbW9yZQo+IHJvYnVzdC4KCllvdXIgaGVhZGVyIGlzIGEgYml0IHdlaXJkIGFz
IHlvdSBoYXZlIDIgTWVzc2FnZS1JRHM6Cgo+IE1lc3NhZ2UtSUQ6IDwyMDIxMTAwNTE0Mzc0OC4y
NDcxNjQ3LTMtcGFuQHNlbWloYWxmLmNvbT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAo+IFgtTWFpbGVyOiBnaXQtc2VuZC1lbWFpbCAyLjI1LjEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAo+IE1lc3NhZ2UtSUQ6IDwyMDIxMTAwNTE0Mzc0Ni54RTVyQ2t0LVBfWGxOa245Yko4WnFZUFk0
blFRN2RvcXpTZDRGckFsSUNZQHo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBt
YWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
