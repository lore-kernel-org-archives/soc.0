Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D9DC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C178D61029
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C178D61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aWp9K6H/frZcLuhpErOYBlfjazbY4m26cEpkAOUSQJg=; b=XCjpzylmlN/rl1
	LY907uGmTkUCUsiD8CHw3SnGvPRq5zOgc2JJ32vQ5RjsOxMaEnm+fg0QW1t2+peYUor2sbJjony7b
	4PAE0zyTuASYwtnWs77TiLCnr4QQ3i1gViszdHdXhs6ylnAJUoP6+e0D5T+w2WL12lRPdm336dr0S
	Ls00dLVhnjGGZX8PJSKo4h1jKomHqkdON5amW0o5xm7XR2JhL5C8J+7LViA4jbxsECatYC1sVGfXG
	fEfAbjyvUL/8HUciDL53Y/+vX5CKyA8qbRCOSU/annDUBoFqQiMWVAGWWr1JAkWUZWLS8omwo95qn
	duLZ91eGSpWqMZDjrdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqXd-0031XR-QN; Fri, 08 Oct 2021 14:08:05 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqXZ-0031Vi-Hj
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 14:08:03 +0000
Received: by mail-lf1-x12f.google.com with SMTP id y15so39874515lfk.7
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 07:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LM8exXLD+iGuyAMHH60gDe9grHMgI1JcUjlMPF2x57k=;
 b=wAIKT/OncDDU+q8mVwqj4X35J7BFH8ELaEOdEzvEv3W0NbgxVugDsVUMEqKlohkPKh
 RHzCsflFbWooMg9e6f282ohA9VC2MXriO+a79584q6Y+Hsbg+LwkLCo583NxX2I+xrGF
 f52GTnVmhZW4vTU61p8cgoQfZN/fyyVHMOb7kLd8v0EnUNlIsDpSCvd7/rFWH/yW96hF
 1VRWSKb3GnOblia+mjfXcQea+CozHQWm09MW7oL71UIZfXFmbbK5iSl5sbJswwZjl5bX
 BJq8loVlSMGzLdsuPaOm6QbCrRBSfWeQl47EjIQv2cOimOxP3jocea3XP5BS/icLE6oy
 kLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LM8exXLD+iGuyAMHH60gDe9grHMgI1JcUjlMPF2x57k=;
 b=3255U09T23jSWTmzJ5BvX7hE0NrjW8YzpKTKWTvoFJ9pmrixffWpsSnYJRqglQvcSA
 dR8ivkUakvznQWFIL+20mdviCv7KuGtGNk/BNXhUw/MAUnS7EGDKuBhL1wVnA19OV+7s
 RA+HWfv7ZihQSn4yu8X9ktrQqBXqyRhdyHcfR5Sg9wr/3lkt285lCBEUsXIdSVocXLOh
 v41hhKkM+dntBvSHoSApgb93V0blsVvgGcPRo3oHesW55yX1iP8CJN8LCHSTM599YOCD
 n6P1Xs0mgTyRU4+1Y4G3IvTQCz7W8En3TRbK+rvPsr4jKRty5MMddbc5PniG+yyv/SDG
 k39g==
X-Gm-Message-State: AOAM532r57+EB7Wupy3PD9xWDsEV7T+oBIfdEe4VhM96T0l0c6wmJKcu
 7ebOo0xPgQBnPpvEkBcEVrCRvw==
X-Google-Smtp-Source: ABdhPJwqlRgCQh8TR4LXiGYJmEDK2IdsjYET0MnbpUDaPuZrXzxm09QRxDQ4ZXpaCtyZC1PRrAa1yw==
X-Received: by 2002:a05:6512:23a9:: with SMTP id
 c41mr7918952lfv.298.1633702077040; 
 Fri, 08 Oct 2021 07:07:57 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id j23sm252667lfm.139.2021.10.08.07.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:07:56 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@semihalf.com, mw@semihalf.com,
 ka@semihalf.com, tn@semihalf.com, jam@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v3 0/1] Add support for the Mercury+ AA1 module
Date: Fri,  8 Oct 2021 16:07:34 +0200
Message-ID: <20211008140735.3290892-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_070801_678466_5E2CF34F 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20211008140734.eamnTRFAfUGgSwmVx9p1doiibExsgs7-GJbya7lKwus@z>

VGhlIGZvbGxvd2luZyBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVyY3VyeSsgQUExIHdp
dGggYW4KQXJyaWEgMTAgU29DRlBHQS4KClRoZSByZXNldCBjb250cm9sbGVyIHBhdGNoIHdhcyBh
ZGRlZCBpbnRvIFBoaWxpcHAgWmFiZWwncyB0cmVlOgpodHRwczovL2dpdC5wZW5ndXRyb25peC5k
ZS9jZ2l0L3B6YS9saW51eC9jb21taXQvP2g9cmVzZXQvZml4ZXMKClRoZSBpMmMgYnVzIG51bWJl
cmluZyBwcm9wZXJ0eSB3YXMgcmVwbGFjZWQgYnkgYWxpYXNlcyBpbiB0aGUKZGV2aWNldHJlZS4K
ClBhd2XFgiBBbmlraWVsICgxKToKICBkdHM6IHNvY2ZwZ2E6IEFkZCBNZXJjdXJ5KyBBQTEgZGV2
aWNldHJlZQoKIGFyY2gvYXJtL2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiAuLi4vYm9vdC9kdHMvc29jZnBnYV9hcnJpYTEwX21lcmN1cnlfYWExLmR0cyAgfCAx
MTIgKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExMyBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvc29jZnBnYV9hcnJpYTEwX21l
cmN1cnlfYWExLmR0cwoKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
