Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6F1C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:27:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C637661393
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C637661393
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ruUJUgWVKe/jXH6mXnON3RWoh+UMxgZC5svIYiLrBHk=; b=evc0o6tMCq2zHLBSoSqN2CHGqc
	NIw6m/x2KBfr5+jbULHjk9lUaK790zhZ1R/emSEOPTnFahHz1zNHHsukRNimYuYxbS8S+Xob1VuBA
	EhIKGFw3oqp7lKNwL8bDjSNFuHkDMOBoQmIIFyF+3eSU96pnRVoQqTHSpVeoGk6DazMYErkUaxml3
	HzgcaoabHnmrhfE+A0ZIkmTdYiWS3lMvhyyjXYZ4XWlavRwO7qEYIjCq/8Wp3Ee6kIJ0+EM5HKiCi
	ifFovX3EX/KiwGlbGdnsISneAg2LG9lllCKbi+GjWDD79gSKk/YfK8GFznEtRUOwqv7OE2wUiPG17
	nBkFBlMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS154-00AVwU-OV; Thu, 01 Apr 2021 17:26:08 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS14y-00AVuZ-Bh
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 17:26:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id y6so2832639eds.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 01 Apr 2021 10:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GMblnBVnulvH6aIz/MT4g7SaDY1kdi5Yx0m1X2b/Wlo=;
 b=fuyL0AYiFQMbYBbNkrX575nXxWE6ZHj11DzMJQBH1+mP9DtWhaygZLhBkV9LoFQYtm
 v/LidO0rpF6xO4zfEPbImcjWuftBSNbQ00SH3IG1FYq6YEmW+zvQ4DNId6zsJUBcouBa
 6Ejrtq33xQpGdjGYwDjuNm7P2btNs552vHU+rnUzGEQIuQ+WM3VJkxEDKvQ2p5E+b+he
 bT2S37DOn8zPIE5hFB7FapdhrXM+QeEeXnBMs9UcREGhbp/kFQFaQhYnEyOi7suZ9Tfg
 oloCyMXRhsY+u2PmZQLD9JEzf6Q0a5JBR3J+Ulb9aqsmQgblZ16/1K3+ULsbW8ruaepW
 3J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GMblnBVnulvH6aIz/MT4g7SaDY1kdi5Yx0m1X2b/Wlo=;
 b=uj4CbHgKpCeMcOA8T72GTT0QMsUc/+LkuBaySZazdm+H5Jmv+dfuOZ5r6BC1IIUu4d
 U6sjkL8vBGWxY+wQ7rhDfsXK7RHoiVf8Taf6Hn5SLIKePFBucSMj9+xV5X/75BYpu42W
 Wyzfr1uoLFsNwXi6ggUbxwy9uSWNilErsaopE50QBaQNmM92vdH4kV+j8w2KgcOeLFMX
 kqYZ+qeU3lXF9Q7M8aiAgEh+GN8BxOBm6uGwy10t/bG5V09l6E/bXIcPuLTfr37zpF8k
 b70YGV+NIVTJyy2zYy2NPbP4nduicQORzPznND/aed/E8PB6xwjV846PvftDLiG+Y+DI
 PCGQ==
X-Gm-Message-State: AOAM533J+g2f6MP5U2EKv2bsEGExIQPURW41wizDBQmj8dWgf9/fCDGq
 JVeRs+9270dDKBNkP1Z373A=
X-Google-Smtp-Source: ABdhPJxl28lLSjZdqRGFy24R1fPXWHpNZxrCKIsIji0q5YfE/004Mvv3PNwnpZSrACN6y3NUIxYsuQ==
X-Received: by 2002:aa7:de11:: with SMTP id h17mr10860271edv.83.1617297958938; 
 Thu, 01 Apr 2021 10:25:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g20sm3745557edb.7.2021.04.01.10.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 10:25:57 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] dt-bindings: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:18 +0200
Message-ID: <20210401172622.3352990-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_182600_569797_8375CA5D 
X-CRM114-Status: UNSURE (   8.03  )
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
Message-ID: <20210401172618.mbg3nraPx9fXbdbqa4XaucZpDoUiEUYKxTDlQbQE67I@z>

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-dt-bindings

for you to fetch changes up to d1e24c46250731204dbf61b5191e4dcf2c2d9391:

  dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop (2021-03-24 14:04:40 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.13-rc1

One single changes that adds the nvidia,pmc property to the XUSB pad
controller binding, which will subsequently be used to implement USB
sleepwalk functionality.

----------------------------------------------------------------
JC Kuo (1):
      dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop

 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
