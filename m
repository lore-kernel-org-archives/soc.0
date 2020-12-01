Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC53C64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 22:34:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C1520671
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 22:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKa7Pa6b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nNzt78S5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7C1520671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lcFnIR50e9cl5grlc3OpQOA4XYgM/uqM2IhUVjSR4lk=; b=UKa7Pa6bq/4sTYB2P4GQWCF5HX
	qpoqkGUBIwZSSuJ811kyfgs1Egv1Q7+q0fy2xNFQd85jL8gkshiYVeAFtzOfxn6VW6g/eljDXOBnG
	+6NMop8KYSuStEjyuYHU6QjfG/i3fkMBjybNQKnIdGw42t5AdGgwE6E27/iqfkr/jA1TRrgerRnbf
	TQLsNVwLomMomxh9qUbq5U9ZPpTf0xUg0/Y/DXmgQph/PIXs/yArjUgFyx7L8QIa60jbyrLk9e5pn
	zgS1KTK6LQevwEuHumUNfRwCQlDUDjiwRBh1c38MYP7j7eOTGJXdk9P+x7vq0JHYLf4ZrPbKYZLFZ
	wP+W8oWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkEDs-0006z0-I1; Tue, 01 Dec 2020 22:34:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkEDm-0006wY-Q0
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 22:34:08 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q10so2142818pfn.0
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Dec 2020 14:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=VyzfJ/61zrG7IqqeZutV6Kfadw97Jz4TS784b21IDMU=;
 b=nNzt78S5S48ZE/IcUMAwdahKLVZjBUFIuQCRYrD4KrxZIdtdww6bR2Fkz6BGspJDZw
 6c43QemXoqYl96hnBfF/FkXY16wo46YNiLIS5ilW/Ja13FEwgQWyTFp2ed+ZYG7J4rIN
 dly3YV3utx5BLHrZ/lK6ZNCwUf3capvAr/0SjlJAkWuT3CSHzpJqBuZv/iZtuTc/xcEq
 FsjhcKMaepOVDzYWk1WAPx5B3elWyOqHU4nAzpTruyMn8OiqAhzvlhnrk1kUe6yVP5pv
 369V4IkybhxupTFJOMXY87Y36U2WvE4Buje7fbvGoee+YPPI7YGSFJprGxqQF8snmBgP
 uYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=VyzfJ/61zrG7IqqeZutV6Kfadw97Jz4TS784b21IDMU=;
 b=a/H5gm1K+GY3XWEW4XXDqD02rkU44wnIfrZbZ2Lsk0OUybJV0m8oKVMOlMIwGOAKPq
 nJUQ7mNyByk1oBXfS5aj3ZCqnVOWxFe/BT+JMK7D21W9CTAoS26AoWyUG6N0m/xX4hVm
 EITlNnnbY23AKvuCEN2wxIu6e9AON9Ce4j54NSLs01Lqewvgni1lEmXPgE1kfOGKIfJP
 +gOm+lKp4ckyV/Ich/UTlXkeJmGJ3HCdowphHcQsJE2cEwFnEITdbQlSw1Sleog3SZnF
 SJidDn6ec0ePgtoPmoQvu2IJLp8cKboY/hrs0QMrRb/tgi7YP0KPrvEp6lklae8QamvM
 7aAA==
X-Gm-Message-State: AOAM5329ORzSHdM7e3Wq7U+Q2Q2/9f6lGvvGUlGTQAENbzc+uNbbNq65
 AJcHyEf+iBk5gNb3mh+sJ8Frgw==
X-Google-Smtp-Source: ABdhPJxBd1oN35igDNqmACXUehdFdQoZ9jvY2+9kX/+z0H8mYfOJtWiRC0fu6GepFnx4poTHsv477w==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr4188310pgk.100.1606862044394; 
 Tue, 01 Dec 2020 14:34:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h7sm736014pfq.76.2020.12.01.14.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 14:34:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] arm64: Kconfig.platform: amlogic updates for v5.11
Date: Tue, 01 Dec 2020 14:34:03 -0800
Message-ID: <7hlfehjgv8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_173406_997048_17D061AF 
X-CRM114-Status: UNSURE (   6.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201223403.f5y-7O24VetMaQybv0sWR4YhPnmFnQJN-c-nhIAmOdI@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc

for you to fetch changes up to ba66a25536dd24b73d36e380c68593e95e4e06a8:

  arm64: meson: ship only the necessary clock controllers (2020-11-09 16:06:11 -0800)

----------------------------------------------------------------
arm64: Kconfig.platform: amlogic updates for v5.11
- ship only the necessary clock controllers

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: meson: ship only the necessary clock controllers

 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
