Return-Path: <SRS0=LG8l=PH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B66CC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 443F9610A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Oct 2021 14:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 443F9610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QeFB9GFk8jTOnWB4FlaoiPXVUEJY0XI92yK5Wr97IwQ=; b=JP9yZ39ntSJU/s
	K3Cquvb50WGyjFhgenG2+AxCQl+RmOZnfQEcrLNVQXxCyjK9BnztkujvxEXqsL6FHUqqInM+KPGcX
	BXkjzb8af2Gju7JMBF4RciBfSREeNBf8dpDshjg32vvCXMspFW8E4LHAdeBu/MpH9DQBmtADBsYnd
	lA6ep9Xb982HG04IxEhnGanoqkF3lRs8xVE12fefK5thaUPBLWzCC5iCwRn9a3O3bLHizvHfBue5Y
	I+dhhYxs+zJFiRW1M0W9zwN5ooEK11hZlfZ10RF2aNCINC98+yzKUWBfHGCAfX9LmWTE9NHdCGwHe
	1pQQ0zMMsO6Pl4c23C0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcprt-001VGf-A2; Tue, 19 Oct 2021 14:13:29 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcpri-001VCs-Oa
 for linux-arm-kernel@lists.infradead.org; Tue, 19 Oct 2021 14:13:20 +0000
Received: by mail-lj1-x22d.google.com with SMTP id s19so6393869ljj.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 19 Oct 2021 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xOf0sXy4r35p6gXgfs572/QVIu+3RqyjsQzstLELFKo=;
 b=xOzg9dDLFJ2rIaTnWwrjon0eSXJL9XxQdU0uVA3N6jx041/RkHqwl2YULEw3kckCHk
 tpoxMWz5/sAEs0hRLL/tOLiDIgtnUOmhF2mSfmhnenpwaMowoiLTioQBJMWsrzPT9p+S
 CbhJXTbaM4u7Ysf5W8W1hublkFZH2AZFWWCEGw3EnTnqoHxJN6ieozBRhOEm81yDwRZf
 GoOvQsmRfAV0kh4aYI4GPaAwH8F0l5k2hm1NyvjnwMbM8fmnJ44spbnr3lhIpv3uK7ix
 bNs2AmFZ4TVfQjKuGJRABruNdp0H0T87n+UFDj/HjbnazX3IzjLYzEDnWs7cJtizQVsM
 +ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOf0sXy4r35p6gXgfs572/QVIu+3RqyjsQzstLELFKo=;
 b=2Umagv7lRGBNuGoNu91Id181to4fPQpXanW0INML3rDLTIUOqk+gZuj/aOLhkcRlWK
 dFcCIaWuvgFUjty9jADCSO1qh2ksUv0KdWFBf5fKO56MmKd9mYcNSnl536NumBuqxlan
 fPdlJWAAj7OPrqZngGQUKMWnhLE+bxf1xk1u2yHaX2+IotmVWhfmWxQ6T8dO4Av10CJl
 XgAOYK4shy910e51ns3xIufZVAqLiqHrxrOsrbbntWgJad/Xkizi4f/ipwRzrixtoIY3
 3Ez9HmwekHPCA9R0Y9h+gute8uForqJLaEtgSyfPDuTdHeg2FSLZUcgvsob7Tc6mMP3O
 aS/g==
X-Gm-Message-State: AOAM533RhiINo6OR7cjfrNCNNDEaCHafenw4zqZI8wkJmJMNOdcwJAK6
 5Z70QE7fyQiZ/3/4X/EScprbXTVkUez19Q==
X-Google-Smtp-Source: ABdhPJwB5/NUjhIzDhmdfovwpekqaEGkErkI7uh6Y4F08p8/rAjaHeGJTWShQGEc56ngqQAFoTpCZQ==
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr6952241lji.447.1634652791875; 
 Tue, 19 Oct 2021 07:13:11 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id d24sm1957805ljc.2.2021.10.19.07.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 07:13:11 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: dinguyen@kernel.org, robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@semihalf.com,
 mw@semihalf.com, jam@semihalf.com, ka@semihalf.com, tn@semihalf.com,
 amstan@google.com, =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v4 1/2] socfpga: dts: move arria10 aliases to
 socfpga_arria10.dtsi
Date: Tue, 19 Oct 2021 16:12:27 +0200
Message-ID: <20211019141228.1271617-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019141228.1271617-1-pan@semihalf.com>
References: <20211019141228.1271617-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_071318_847360_B3FDC73D 
X-CRM114-Status: GOOD (  12.68  )
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
Message-ID: <20211019141227.B3PaidDlcuIYm-qCVFqwwOLjCLtXupLcUqV-U80sSyM@z>

c29jZnBnYV9hcnJpYTEwX3NvY2RrLmR0c2kgZGVjbGFyZXMgYWxpYXNlcyB3aGljaCB3aWxsIG1v
c3QgbGlrZWx5CmJlIHVzZWQgYnkgb3RoZXIgYXJyaWExMCBib2FyZHMgaW4gdGhlIGV4YWN0IHNh
bWUgd2F5LiBtb3ZlIHRoZXNlCmFsaWFzZXMgdG8gdGhlIHBhcmVudCBmaWxlLgoKU2lnbmVkLW9m
Zi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+Ci0tLQogYXJjaC9hcm0vYm9v
dC9kdHMvc29jZnBnYV9hcnJpYTEwLmR0c2kgICAgICAgfCAxMyArKysrKysrKysrKysrCiBhcmNo
L2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfc29jZGsuZHRzaSB8ICA3ICstLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTAuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3NvY2ZwZ2FfYXJyaWExMC5kdHNpCmluZGV4IGE1NzRlYTkxZDlkMy4uMjZiMTY2MmNj
MDBmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTAuZHRzaQor
KysgYi9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTAuZHRzaQpAQCAtMTAsNiArMTAs
MTkgQEAgLyB7CiAJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJI3NpemUtY2VsbHMgPSA8MT47CiAK
KwlhbGlhc2VzIHsKKwkJZXRoZXJuZXQwID0gJmdtYWMwOworCQlldGhlcm5ldDEgPSAmZ21hYzE7
CisJCWV0aGVybmV0MiA9ICZnbWFjMjsKKwkJc2VyaWFsMCA9ICZ1YXJ0MDsKKwkJc2VyaWFsMSA9
ICZ1YXJ0MTsKKwkJaTJjMCA9ICZpMmMwOworCQlpMmMxID0gJmkyYzE7CisJCWkyYzIgPSAmaTJj
MjsKKwkJaTJjMyA9ICZpMmMzOworCQlpMmM0ID0gJmkyYzQ7CisJfTsKKwogCWNwdXMgewogCQkj
YWRkcmVzcy1jZWxscyA9IDwxPjsKIAkJI3NpemUtY2VsbHMgPSA8MD47CmRpZmYgLS1naXQgYS9h
cmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfc29jZGsuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3NvY2ZwZ2FfYXJyaWExMF9zb2Nkay5kdHNpCmluZGV4IDdlZGViZTIwZTg1OS4uZTli
YjU2ZWMxNWYxIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBf
c29jZGsuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zb2NmcGdhX2FycmlhMTBfc29jZGsu
ZHRzaQpAQCAtOCwxNCArOCw5IEBAIC8gewogCW1vZGVsID0gIkFsdGVyYSBTT0NGUEdBIEFycmlh
IDEwIjsKIAljb21wYXRpYmxlID0gImFsdHIsc29jZnBnYS1hcnJpYTEwIiwgImFsdHIsc29jZnBn
YSI7CiAKLQlhbGlhc2VzIHsKLQkJZXRoZXJuZXQwID0gJmdtYWMwOwotCQlzZXJpYWwwID0gJnVh
cnQxOwotCX07Ci0KIAljaG9zZW4gewogCQlib290YXJncyA9ICJlYXJseXByaW50ayI7Ci0JCXN0
ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOworCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwx
OjExNTIwMG44IjsKIAl9OwogCiAJbWVtb3J5QDAgewotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
