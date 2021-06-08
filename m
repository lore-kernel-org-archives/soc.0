Return-Path: <SRS0=66GR=LC=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC51DC47082
	for <soc@archiver.kernel.org>; Tue,  8 Jun 2021 12:13:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A8BFD6124C; Tue,  8 Jun 2021 12:13:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EEB961185;
	Tue,  8 Jun 2021 12:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EEB961185
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wm1-f42.google.com with SMTP id l9so1701397wms.1;
        Tue, 08 Jun 2021 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FeihunwIMKI7/M9F+u4lbNvLXuFrJY636ioeY014Su4=;
        b=EvGQAy0ig/kqB6utTO/JurrQ9MQa5CwTxgV3sdiV5+oJpoTjap93s2deS/haLmSNEY
         krIR8Ws2TSJArJFnE9E8YyMXww27wtBDd+Fx9Q1PA4wKJFdov+JITYzUMLuxVAwajOtr
         uUWKVhq3y6oaWQRkIjEkl5NuDmxPBrExElbtL7dY5z7ptT/N5uAptRH4NIsVKRntjMPR
         /uoVmZuH7FLel//6MeivE0WozvE0cYJII+ovMlVGUVmsP7m/F5dlhkbAB3HMjY0abCII
         M/KhWbdV0arIMmWXjwUCm74i3zOAfXAVdnso6jR+DTWDVnRcpGHtZLB3iqfMx+dvZ3K8
         CHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FeihunwIMKI7/M9F+u4lbNvLXuFrJY636ioeY014Su4=;
        b=oa2ACWy0ool5UqrHJeDIvHI8fA/KSXI87s4EpnAe07Y0zJOnTphZKFqeLXhw+Ocvmv
         vfoJTnl8o7Y/o8KBbcWHzHBcYioWTq6f3xnqHFr6cAJ88SB1Rf/Rc/gXIwiK13hFVsam
         W+fkhrKfpdV9SIyyYLwNQVwYDWscCAoU7ySHI43emXYlzBJMdQlu9v1eEghtYse8ZRbr
         guIr2hCNYhjjiI73ISClUumcUaIs/5VHLlsM8/3cda+bnVCrTs6I1txoek9MxIaaz/Sm
         Ig8CVZD96oMjvbqUSfYnM/WNWEjGTr94IT5/xcw+v+JIHEADcz+AJC5MJixndDM7PqCi
         6kpQ==
X-Gm-Message-State: AOAM532tWIuljmB249tSOJY0FdiNfEG1Ou1WDepqUotgq1Tnj1xusbJb
	+CI+CdjPsmVmIQzpFNy2aBg1bBNAIYc=
X-Google-Smtp-Source: ABdhPJzlNf7ossuAEutPHptMsCAhcoSQO2f9IZYHdnyrWan50tHM/Xmk54r68EJ1CeNz4kcbd8Xj4A==
X-Received: by 2002:a05:600c:3393:: with SMTP id o19mr3992803wmp.163.1623154396375;
        Tue, 08 Jun 2021 05:13:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m3sm20701968wrr.32.2021.06.08.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 05:13:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.13-rc6
Date: Tue,  8 Jun 2021 14:14:57 +0200
Message-Id: <20210608121457.3202430-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-arm64-dt-fixes

for you to fetch changes up to 9e79e58f330ea4860f2ced65a8a35dfb05fc03c1:

  arm64: tegra: Add PMU node for Tegra194 (2021-05-28 17:45:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Fixes for v5.13-rc6

This contains a single fix to eliminate an error message during boot
caused by the lack of a PMU device tree node on Tegra194.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add PMU node for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
