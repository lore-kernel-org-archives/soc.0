Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5324C2D0E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:44:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5933E20B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 14:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xLBs8H2+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBlnwK92"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5933E20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/1fRiOKQcrIlxq1hDqdrqHmlhOXRxKeDQ7HGzkX60w8=; b=xLBs8H2+VMewefbHCIOpjCj9s
	dbE58JFgrM//ui3Coqok5slAjhh6n8sm68ibLOtoy8Gw7BLf8vJ8J3gd54BBqv6e29R8C7/phzVkp
	KGHIDSyDJRMH3t12cr6kGFWVA5NhSE7R2jVZbl/4e/tYZHdRUPtUQeVRqxvmJimryVKinynVNo4f+
	MH2+8cP9R4wc79skFLIk/A7oY/XALwYq1VW8nZlkzXX8dR/ZDKMolIzxdoBVSbeG+LoX/d/QaPIil
	LR72XfCNrBgD8iyG/8QyqgheCDaZGQ5C2VlVPTrZWJal92i/Ur16wR4UVgcUDJJyc3fk+ScOLAweO
	y7zypyeRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kieyR-0005Qh-OH; Fri, 27 Nov 2020 14:43:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kieyI-0005Nm-1J
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 14:43:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t4so5793911wrr.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 27 Nov 2020 06:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KEKSlpfgpbLCs7hwatanNSP8US33gujVVxIHTOMhDYo=;
 b=sBlnwK92jyAt/OQ350OygpGMZnhlU48PAlUqKkAjF66DgKP4v+G6YcpCEng54vcb40
 20KzalTs5LizLFMhwEpbAEzuWGrx7cKQxSFEgSDOG2tC2RCaL1d2rNtiQIP4EjmjCOK2
 N8hf93NzX5pNnqbXPcrIu4eAztOyS+MYjrYFOfnCLqDaUVddZf1cVSyybhX6XFKCOTPs
 f9S0OqpsokQrziT1AT9amePClJILR2fMvVUjctHsk19pItAINMRweIbpDBwO9BpOcA7p
 etmQ1iy+QSK6yHVtkOc8+62+cUbvoyHOyEGx+QSAHdhLZxJasfpwHJEaOoq0hivHgV85
 5Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KEKSlpfgpbLCs7hwatanNSP8US33gujVVxIHTOMhDYo=;
 b=LmQslKUpOzvLn3r4SYtqLUq8+FQ8s6XzbvxyRSxEJG2dBfb0VOgcND+/2yvZ4NF0Xm
 wNjeMUPkJ29FkvUqf5k+Hw/8BisgcehiiieAdr8m0OnlY4lSKGXyE7Rn20spF4fs72z7
 iLVhS2Gd2RGJo7o0n5Qb2emmBzW/Q7ZKbfmDyLGP9Unfgh9FEKWyeg46shfP3dW/Dkn3
 BIWMei5WrPTmmKHpX8U7SvoTjwgEh5LcczUhnWiuhC4GJKffbu3bOQuSnszYGNe2ayLY
 J0xCmCObcW/Nue1DkcwTPuYC/kMl1dmGsw8V0PA3KcYamsGmqFmdV1ANqZlQ/3uoOhnV
 qAVw==
X-Gm-Message-State: AOAM530JVkA7U/MvpNcjys36Lrdl4jgFgN2F5meBwaK1gRabQHMKW5Jv
 xljc2iNZMvorWaQb6QmRpCQ=
X-Google-Smtp-Source: ABdhPJwpGWTkgzcQN4p6Qs7NL384aOExPblrvngk8bGoyYH3HKpuBmjn4V3udouj2HkRyHehxLR/tw==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr10867775wrq.411.1606488216389; 
 Fri, 27 Nov 2020 06:43:36 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f18sm14839458wru.42.2020.11.27.06.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 06:43:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL 3/6] firmware: tegra: Changes for v5.11-rc1
Date: Fri, 27 Nov 2020 15:43:26 +0100
Message-ID: <20201127144329.124891-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127144329.124891-1-thierry.reding@gmail.com>
References: <20201127144329.124891-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_094338_152881_849052E8 
X-CRM114-Status: GOOD (  11.98  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127144326.VAxlZn64H0yVYkBqj9EBmkYfNxPO53je5tGWPnidEAI@z>

Hi ARM SoC maintainers,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.11-firmware

for you to fetch changes up to 9294996f0be40e9da818ed891c82397ab63c00d0:

  firmware: tegra: fix strncpy()/strncat() confusion (2020-11-10 20:15:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v5.11-rc1

Contains a single fix for a strncpy()/strncat() issue that some versions
of GCC are reporting.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: fix strncpy()/strncat() confusion

 drivers/firmware/tegra/bpmp-debugfs.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
