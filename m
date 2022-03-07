Return-Path: <SRS0=unCP=TS=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B9EC433F5
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 18:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B7DDC340EB; Mon,  7 Mar 2022 18:23:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE3CCC340E9;
	Mon,  7 Mar 2022 18:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE3CCC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id qt6so33836046ejb.11;
        Mon, 07 Mar 2022 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grJHan079spBD1xr3tK9eEAF9VeWYCL6jyr/bfrYsbI=;
        b=lGy9Giku8oWRY3wD/gGSjrt2mWKxeYFtkDi23+qneIJF+i+a18Yw+cWqqLa1wjiHKh
         5Hz5PTKPf/g6bpIUfvwmDliodWl7GaqNkVAHoMOcSMUvBf/q32GhN7op9BWW33uwut7D
         U/4/WcqaMrOQ4bALdGf81QOQc1L6hgWHjpBbRMoDskpWfW+8S979/C6ZWpGEw8KhfCt4
         eJbDpkfcpwpIZX5zD3NUdfBsbhZo7p/D3MuR503ga2tH+n22JSZw22BPse1sNZTCvEVC
         I6Jc4F9g4piFrOVQCaLOhb8dfPtT9pxjLUIfno/P3rLB5UyW4pWsKOnO6eQVoIJHVNjj
         CV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grJHan079spBD1xr3tK9eEAF9VeWYCL6jyr/bfrYsbI=;
        b=xNUohUIIqdk9n16CEc3aYY5DiazHWefZmnlFFgeV9jVW9tzJCAziO+2Oy8h2bp8qBh
         GRN/8IC1Ovjooj9XqeZCYWk5u9f/ubb5t22Iv3GiQOvf4JBj2uNM6kxWoAjmujpC0N/B
         eBr1sV8hjcokPK2kLbj4+fMXOmWAyu7ySSR3DDCfRt8N8vydSOgnRzp76Q1ZKzxO04bx
         9tA1EZn8fBSV4E6pjSIBkoKgj45lOTM49x9IwZYSIh0Q0paTXfFZJ34n6fnWvKbuuCN3
         9UlNsAGeMOrSY0hSTy1wAkEwu4svRHVcQznUue2VjFDD0OC2sCaqhx9hd0Jc0hQ0cw3/
         4mNA==
X-Gm-Message-State: AOAM531kkCFTEilSvl1gZy5QMd4Gd955h7enxkjQmm+4SmrMPOIHE5GO
	uA1pzXaGLsB+mSrWLhpXlUUNfgxFD9s=
X-Google-Smtp-Source: ABdhPJw6nCk3FR84fF8EPc5TTVAUIb/ZICsm7M8xvO3upk3MyqS5kFWG1L/Sud/tp7uk9rt0xRPhqA==
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id l7-20020a170906794700b006da892f2503mr10009329ejo.710.1646677412571;
        Mon, 07 Mar 2022 10:23:32 -0800 (PST)
Received: from localhost (pd9e51a48.dip0.t-ipconnect.de. [217.229.26.72])
        by smtp.gmail.com with ESMTPSA id q11-20020a170906144b00b006cf61dfb03esm5062042ejc.62.2022.03.07.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:23:31 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.17
Date: Mon,  7 Mar 2022 19:21:20 +0100
Message-Id: <20220307182120.2169598-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 914ed1f56581f99094035f1cc989ab4498104e94:

  arm64: tegra: Add host1x hotflush reset on Tegra210 (2021-12-17 14:58:58 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm64-dt-fixes

for you to fetch changes up to ebea268ea583ba4970df425dfef8c8e21d0a4e12:

  arm64: tegra: Disable ISO SMMU for Tegra194 (2022-01-27 18:35:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.17

This contains a single, last-minute fix to disable the display SMMU by
default because under some circumstances leaving it enabled by default
can cause SMMU faults on boot.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Disable ISO SMMU for Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
