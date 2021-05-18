Return-Path: <SRS0=EhE/=KN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F15C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 May 2021 23:20:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5018F6124C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 May 2021 23:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5018F6124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Py/+GygsSlBxipBuY+RDsjD/cAGcqROI1E0EgTmj+to=; b=DV81pmfpUz7ETT53i8twqqXP1
	Vtcrk3OVoxMLPRlTpGJBzL/E4MofVCtnX0wXzj7avR7aX+QW3EdALaPbOMAO7brK9tukYC8ZqPzsa
	EFhNqfYoRsfxdkEbEE9XBWD1xA4tmJtwgdrZoLBEUUhrLG4LcqQePYO59hJzLOrBb3JLjnf3WOrCn
	f0waDhLBzbBa9vKKfosX4Kvo2b8CziGWU4gFxy7OvjwLLGrxWmxkggOYTimGg53mA4j6DCW4778Ot
	8bA3fGODRHHpLlx15+55A00i/NKKnzzurr4cPwFq/WLQ6JdrqgS2KojWpJuwRAqG+VcDA70n2QvgX
	gudaxJkPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj8yg-0029hx-D9; Tue, 18 May 2021 23:18:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj8yd-0029hQ-Fp
 for linux-arm-kernel@desiato.infradead.org; Tue, 18 May 2021 23:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=t1lUkNBuVC2UZABZ7mjXl1iS2OFEu1Ax24kG7Pa9v9o=; b=Yyl3YfvWL0ArMwClacTIkhnenC
 2tWDwxhDCRpwXDBy0ejoDeL4HOnDsEurSfOTEjNk8l6EcCvxn59wS/ghP51oKCHr2dDoxQ8QU2YoK
 ZOLhhytjUnRJWYeeX861kVR03l2WB5VlVgBi5K/0Fy4MKUD0wyY5lJbUaevn44LoFhItwkjwJfqqh
 f4yR5Cyq5kA7x7q9ZBzSWFfJTmFLWxS0nqO0IMBnupLn1unmMVAqNmlaHbF2a8m6AiyAr1lp+u6kB
 tl+tm9yGpOm1tNL4yvTSbcIrB/Q6ckiQYftJzgp6QH2248FWMyhpFsiaqT09ebRHxYPrOKDU/8h/q
 BiHVCBBw==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj8ya-00F1EF-Hs
 for linux-arm-kernel@lists.infradead.org; Tue, 18 May 2021 23:18:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id z13so16257832lft.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 18 May 2021 16:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t1lUkNBuVC2UZABZ7mjXl1iS2OFEu1Ax24kG7Pa9v9o=;
 b=oIb6bCshL727qAb4uQIy4tdqNvs4pKTGrZeO2A2o7UfVH/eztAfkfvbBEipSokq+59
 FoJYB78uhQ4mijp8vZr0SP4cPRxTCgv+9YN3uSxCr2FnO74K7P78F1v6PtUE7f6iC8Pv
 FPES6jgvgT3i/uSIj/QqFa76gtm49FrRaxPB30vHeUYSMgKZxTDA9R4MdmfdBPJPUrAk
 PXjdR2Bdhpl2t8wkJ57L3l+BRB1V7Q+57X8geh0vCm1fe1G8J0cZ40q6tT3ssBW4SGXn
 7chziYboyIHfa834KfPzy+3k9wESGMTH0oTvTN+o2L+36uT6tElzd3NtoyPiJe6LOZLv
 Maww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t1lUkNBuVC2UZABZ7mjXl1iS2OFEu1Ax24kG7Pa9v9o=;
 b=IoyzfkOZNPrz6VsTyFcJ/u0pcKaCA1YFLqrIzLC7OBjgNxbhVSXqnG7cruZZ3M2FS+
 PXUdoU7Kdq5zth1i40lRsRnjy8PSHEmZA0O11CXoAC6Ge7QecqFPRztMWUU7NZ/A18G3
 WWXtU8mBvmz1Fq1SSTKqopB7DHfmyBw/qO8gy+BoCnazV0W0LjPNALU2LNb78RW15EkZ
 WbFBphot1fMRa9Glmrkc+QaIpLiiSCkhF60y7xDKHrS3Ynji8sa15e3dd9kST2ceDAR4
 p69sPS/GQr4vcXs5B4n/SNlVsYYTS3mG+C8Vg22urEJb0hI6dIFAuzrwzBEmIcJElC+I
 /UBA==
X-Gm-Message-State: AOAM531W+AXkUDWTG6HdNzrGSs3egRnw/7AUJEiErhVWQ/SMI5ejQNoA
 N9LN3XziWxMckD0Sz7DHxqXAPSRONCAH2LTcSv6Uxg==
X-Google-Smtp-Source: ABdhPJwbX+FemxVEp4TpL+OaKW57UtYIhtlS+hTGYuSbNLuqKI0W4v/DXLByxnfuX+1snj0AfuXOkxd2UaRJJjUo3pw=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr3321479lfd.529.1621379890103; 
 Tue, 18 May 2021 16:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com>
 <20210517193205.691147-5-clabbe@baylibre.com>
 <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
 <YKOO8UxdmZBjYbt4@Red>
In-Reply-To: <YKOO8UxdmZBjYbt4@Red>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 May 2021 01:17:59 +0200
Message-ID: <CACRpkdYqaoggyBO9=fdi2iUh9O0Y_jT5jnc7+qbE9HzEWK57Sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
To: LABBE Corentin <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Rob Herring <robh+dt@kernel.org>, 
 SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_161812_649137_8184797F 
X-CRM114-Status: GOOD (  14.82  )
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
Message-ID: <20210518231759.tR-vFzJskTuqmWw8dvUmGZOXcikzmw-OZpewmqKngOA@z>

T24gVHVlLCBNYXkgMTgsIDIwMjEgYXQgMTE6NTUgQU0gTEFCQkUgQ29yZW50aW4gPGNsYWJiZUBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+IExlIFR1ZSwgTWF5IDE4LCAyMDIxIGF0IDAxOjQ2OjIwQU0g
KzAyMDAsIExpbnVzIFdhbGxlaWogYSDDqWNyaXQgOgoKPiA+IElzIHRoZSBGSVMgYnJva2VuIHNp
bmNlIHlvdSBoYXJkY29kZSB0aGUgcGFydGl0aW9ucz8KPiA+Cj4gPiBEb2Vzbid0IHRoaXMgd29y
azoKPiA+Cj4gPiBwYXJ0aXRpb25zIHsKPiA+ICAgICBjb21wYXRpYmxlID0gInJlZGJvb3QtZmlz
IjsKPiA+ICAgICAvKiBFcmFzZWJsb2NrIGF0IDB4N2UwMDAwICovCj4gPiAgICAgZmlzLWluZGV4
LWJsb2NrID0gPDB4ZmM+Owo+ID4gfTsKPiA+Cj4gPiAoTmVlZHMgQ09ORklHX01URF9SRURCT09U
X1BBUlRTKQo+Cj4gTm8gaXQgZG9lcyBub3QuCj4KPiBwaHlzbWFwLWZsYXNoIDMwMDAwMDAwLmZs
YXNoOiBubyBlbmFibGVkIHBpbiBjb250cm9sIHN0YXRlCj4gcGh5c21hcC1mbGFzaCAzMDAwMDAw
MC5mbGFzaDogbm8gZGlzYWJsZWQgcGluIGNvbnRyb2wgc3RhdGUKPiBwaHlzbWFwLWZsYXNoIDMw
MDAwMDAwLmZsYXNoOiBpbml0aWFsaXplZCBHZW1pbmktc3BlY2lmaWMgcGh5c21hcCBjb250cm9s
Cj4gcGh5c21hcC1mbGFzaCAzMDAwMDAwMC5mbGFzaDogcGh5c21hcCBwbGF0Zm9ybSBmbGFzaCBk
ZXZpY2U6IFttZW0gMHgzMDAwMDAwMC0weDMzMWZmZmZmXQo+IDMwMDAwMDAwLmZsYXNoOiBGb3Vu
ZCAxIHgxNiBkZXZpY2VzIGF0IDB4MCBpbiAxNi1iaXQgYmFuay4gTWFudWZhY3R1cmVyIElEIDB4
MDAwMDAxIENoaXAgSUQgMHgwMDIyMDEKPiBudW1iZXIgb2YgQ0ZJIGNoaXBzOiAxCj4gU2VhcmNo
aW5nIGZvciBSZWRCb290IHBhcnRpdGlvbiB0YWJsZSBpbiAzMDAwMDAwMC5mbGFzaCBhdCBvZmZz
ZXQgMHgxZmUwMDAwCj4gTm8gUmVkQm9vdCBwYXJ0aXRpb24gdGFibGUgZGV0ZWN0ZWQgaW4gMzAw
MDAwMDAuZmxhc2gKPiBTZWFyY2hpbmcgZm9yIFJlZEJvb3QgcGFydGl0aW9uIHRhYmxlIGluIDMw
MDAwMDAwLmZsYXNoIGF0IG9mZnNldCAweDFmZTAwMDAKPiBObyBSZWRCb290IHBhcnRpdGlvbiB0
YWJsZSBkZXRlY3RlZCBpbiAzMDAwMDAwMC5mbGFzaAoKSG0gc2luY2UgaXQgc2VhcmNoZXMgYXQg
MHgxZmUwMDAwIHRoYXQncyB3aGVyZSBpdCB0aGlua3MgdGhlIGxhc3QKZXJhc2VibG9jayBpcyBz
byB0aGUgZXJhc2UgYmxvY2tzIGFyZSAweDIwMDAwICgxMjhLQikuCgpGSVMgYXQgMHg3ZTAwMDAg
c2hvdWxkIGJlIGVyYXNlIGJsb2NrCjB4N2UwMDAwLzB4MjAwMDAgPSAweDNmCgpDYW4geW91IHRl
c3QgZmlzLWluZGV4LWJsb2NrID0gPDB4M2Y+IGFuZCBzZWUgd2hhdCBoYXBwZW5zPwoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
