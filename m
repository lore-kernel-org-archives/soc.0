Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41ED3C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139E461130
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 139E461130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EDB/eSEhs2vDxSdJNA6UeNqw/6VGuPQjysILKYmOpbI=; b=v/BvWi3bm9i5Er
	ut2RNClVUSIvFBeexVpIN7Md6ReKd100PCeGW7HbpsBeL51RsbGVGiYFQB1s+kHUcVf9sNeb/itiK
	nrYLceMc126f0l58Q/2woIRaPLFysGy7KWq7Dk1E0QR5EhjI9bEGoo3RCO0QY9R2puxTA1LhQCiyw
	4J1AMmd4K2gISTO14WXBBt7GF5HENFmoqRgNq24gzTW7jeuy/cQmqD1LWWu2BrjS4SxPxfxZ7fanY
	3iuVjP1Enpt4Owbqv/uaFyJ+HE+LPhGHYDwahPMvYkdy02uEQMyxAgsP8rISLWq940utSiHIz9sU+
	JvX6PVIN1vj2/BPgH0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZv2-0085ay-VU; Thu, 21 Oct 2021 15:23:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZpB-0083Fo-4s
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 15:17:46 +0000
Received: by mail-lf1-x136.google.com with SMTP id u21so590717lff.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CtRyggFXcz/RI+RZSAJdFk1m/ZMHHugcxXkxvKPW+eg=;
 b=1qG4vDyIEQ/GiHT9Dihtt0I48ay0Jq/+nt45F0YctIhvvhQufvUitJXaEKil5bU+Dt
 7Lra4wO83C++jEi5A78olD8ZZWEmLxculPj35zh3t9gRGQiQNN51WIpZxZdKPSrFfVRE
 DYAryz9Db4P400gNNKUVn/sT7rd9SjxeMEc9Ei0FR83t7jhS4TIh++4/lm9u0dEPbVne
 rM/CR4Y/U9IcikiYTL4h8zYtkfDGS8MV2+E1DZ9EvZ/+rqR0fMgKLE0oFCWPq3MdPCog
 4YiZf5G+tNkOaQRIUgcmF46M2/g7QthZFwyTSjgI4yfY9e3G4X0mUiTHiezYrRwMgTFA
 xvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CtRyggFXcz/RI+RZSAJdFk1m/ZMHHugcxXkxvKPW+eg=;
 b=0xWKTP5lx82chyzmQ5oSB+33oeUHgs4lP+wwt1MsI5JQZLQsq8GD50dIxmkMd7f/h5
 woZhV18hxoxiE7DMTmuHc5CdIydtLVWEhQKyuFmbaaBS2RzduBUFqgtki6AlLsBDzngl
 k4W+sJUNOrAFLmOmHyWLqObW4AVDftRdVS/YTHQYR/DJZ/Z7ILTH16rSW7scSWhhBBOH
 OVjMZHomXdyMMp+KfIR88uskVT88L3EalIEr6DHmivUiDiitxytTm0P2GMP3ul9Ax4Sv
 mnZmcXxPhmE0Ex2anT5eLtuB1sc3vREeSXnjjBkNZ/UAOZTF+HJ8ACb3WtGNcVKiFf2T
 4a9Q==
X-Gm-Message-State: AOAM5325v9DNi9Hb7+BXm5Yfs9PESkmNZ8sEEV2OzdCzUjHjvkyPZRvI
 PYMPf+5ZBwLSLMfacYHTpYKDhQ==
X-Google-Smtp-Source: ABdhPJzNgwkkDcYkQqDEOGkiFxn/k0IglKMB0mXc7n/fXSmfIuyjyAuuDnQe9l9k9iouk+8WSIha1w==
X-Received: by 2002:a05:6512:3341:: with SMTP id
 y1mr5908152lfd.513.1634829462309; 
 Thu, 21 Oct 2021 08:17:42 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id bt10sm91113lfb.193.2021.10.21.08.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:17:41 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 dinguyen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@semihalf.com, mw@semihalf.com,
 ka@semihalf.com, jam@semihalf.com, tn@semihalf.com, amstan@google.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v5 0/1] Add support for the Mercury+ AA1 module
Date: Thu, 21 Oct 2021 17:17:35 +0200
Message-ID: <20211021151736.2096926-1-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_081745_288711_844621F9 
X-CRM114-Status: GOOD (  10.92  )
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
Message-ID: <20211021151735.QXRuLvCgA_erYjrq2DLfzdrhIwBqVe-DwosO87ppv0s@z>

VGhlIGZvbGxvd2luZyBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciB0aGUgTWVyY3VyeSsgQUExIHdp
dGggYW4KQXJyaWEgMTAgU29DRlBHQS4KClRoaXMgdmVyc2lvbiBpcyBhbG1vc3QgdGhlIHNhbWUg
YXMgdjMsIG9ubHkgZGlmZmVyZW5jZSBpcyBoYXZpbmcKZGV2aWNldHJlZSBNYWtlZmlsZSBlbnRy
aWVzIGZvciBhcnJpYTEwXyogc29ydGVkLgoKdjU6CiogcmV2ZXJ0IGBtb3ZlIGRldmljZXRyZWUg
YWxpYXNlcyB0byBzb2NmcGdhX2FycmlhMTAuZHRzaWAKCnY0OgoqIG1vdmUgZGV2aWNldHJlZSBh
bGlhc2VzIHRvIHNvY2ZwZ2FfYXJyaWExMC5kdHNpCiogc29ydCBhcnJpYTEwIGVudHJpZXMgaW4g
YXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUKCnYzOgoqIHJlcGxhY2UgaTJjIGJ1c25vIHByb3Bl
cnR5IHdpdGggZGV2aWNldHJlZSBhbGlhc2VzCiogcmVzZXQgY29udHJvbGxlciBwYXRjaCBhZGRl
ZCB0byBQaGlsaXBwIFphYmVsJ3MgdHJlZQoKdjI6CiogcmVtb3ZlIHNwaSBmbGFzaCBub2RlCiog
cmVuYW1lIG1lbW9yeSBhbmQgbWRpbyBub2RlcwoqIGFkZCBncGlvIG5vZGVzCiogYWRkIGJ1c25v
IHByb3BlcnR5IHRvIGRlc2lnbndhcmUgaTJjIGRyaXZlcgoKUGF3ZcWCIEFuaWtpZWwgKDEpOgog
IGR0czogc29jZnBnYTogQWRkIE1lcmN1cnkrIEFBMSBkZXZpY2V0cmVlCgogYXJjaC9hcm0vYm9v
dC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIC4uLi9ib290L2R0cy9z
b2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzICB8IDExMiArKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfbWVyY3VyeV9hYTEuZHRzCgotLSAKMi4y
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo=
