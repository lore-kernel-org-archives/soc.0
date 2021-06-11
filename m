Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E7EC48BE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A44761357
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A44761357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dW4G5dhc9Zqhcuyy9oQeBiftV4VJggtFdAVZ2Y4mLg=; b=Ye8YBDsMA2m8tx
	m7nh9Ls7NNrUMpb22otYzwhIYHRN7EDg3SG19tiowLlpdIHMr5TkMH3SpFTPZEc4mzqmGRjQGw1r2
	8kJHACIG6h97vun4hzCu9hlELdXmQmkKscaCoFXE5doiVVBHt0FLbPCVvBEcFLAVKoj/w/FBB92Jq
	6BplmSy1Ms3dAPBrm9dbnugLu1ntwWQcW8UflVhwkzGOheANyr9sKSqyLwjASJm4iphQRZ0AhFnCE
	uR4CdpHXYRthUA9EURHWMVglEHdmy7UpWY/9AXfH+XkcJhXcEmjBBsZ7Eas0VP/bmNFehnsoQIGga
	ApQpYdxjav0LI6SXsnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkHM-0064xy-FW; Fri, 11 Jun 2021 16:45:08 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkGT-0064V8-Hw
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 16:44:14 +0000
Received: by mail-wr1-f54.google.com with SMTP id n7so631263wri.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V5XYrnY/xVnCPcibAwboKgHCmrwG1kEd9Tte7IqhonY=;
 b=AT2W/U1lava1Ca/zNFJ6uPGusersVIS6uHclYO2H/J6Qp1tt86eedRIFMioYpe8fqs
 yrD74cQCB7gTkJ/kRf4Fa2ZDARKHtlWEHK8gvqQBojB2HoPIRlTiyqeoAzLb31bjDOwU
 2fOqkJjuIv2s32Ktao44dlmqzx8n0MqHplzQKIo52w2TgS1YTFBc7LTxsz44LekNZlk4
 +/JNa06aUjBU2QjmyFo0UWIdMu4V0iRUcJJZY/duMgkHzvhbWsV1XwULSqhLiHm75T3K
 cG6DWTBPdfFjw8a2Jkvt7WvEfdmK4GqT3hWfjSP5PZJH7CTxPDGg2tMwz70xIRtgVOGt
 hLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V5XYrnY/xVnCPcibAwboKgHCmrwG1kEd9Tte7IqhonY=;
 b=Cc7FlMgt3OWhVWqQdDKYcip3VyDHyzPjH7meiEEMpkxPoYt+SSx7jXImmOIbF8VWyo
 hdOyGrygOkq9bym19BvrI9wxxLi9NV8A/kOIcevnlhMQKWZN7o3RbcTsHI+WQ11g1pJy
 CLtt0DuZgklaBf84ESKgpgxTVkv6017BDo1yGV3CqOLVvX0tYC/mn2ryUec6PvWvo8Ln
 wSlBNXJWP1nl3zeMJR36dQMJL1GSuWdi224jONm7dZMHSPD83YseIGWR9x9TKnEtzAxK
 kViaosQkqUAiykm7IXq1cKCVlbbhbdBI79tGdipho3jpwQdzDelGGcpkgehe09EwrDmX
 kv/Q==
X-Gm-Message-State: AOAM5314dTWNjSxPtYVPPY7fbNNl92IM0250g3ld5RZFyn52UICPFzsp
 SYHMR7mhPsOcEI+/fDUQAeH+8QBUbts=
X-Google-Smtp-Source: ABdhPJxlsbAOLOU1i27Ibi/lz52sIQVKiBthECxJn+E7iF+bsBneHJrvzhZpxGhPpbWTOw5uSu00yw==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr5073620wri.36.1623429792242;
 Fri, 11 Jun 2021 09:43:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id p5sm8063831wrd.25.2021.06.11.09.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:43:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:36 +0200
Message-ID: <20210611164437.3568059-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094413_639150_4B7F83F4 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210611164436.zxRD51RKubyGg-lkSSJLMp_R2yuDrgnsBuiARx5SyxQ@z>

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm-defconfig

for you to fetch changes up to 4302331fdf4440b96dba583384a0e2b759cb13bd:

  ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL (2021-05-31 11:43:11 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.14-rc1

Enables the devfreq thermal support to allow using the devfreq device as
cooling device for the system.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL

 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
