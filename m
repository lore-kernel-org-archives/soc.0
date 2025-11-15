Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD2A1B7F4
	for <soc@lists.linux.dev>; Sat, 15 Nov 2025 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763197255; cv=none; b=OOadbiZdJNEM0Wof3js6NcPQuNmQcteHgO7cckzeeLFbi7dEVuTfCISwtbZq5lOjz1durWWoKCo5YNhL0ZL+BSQIqIzBEbNdtLczai0NQRUnqho7KEGBzaV5ya8lliWbJcbeYrtyQVfKHrCRZ1i8hJ7Ps/4wtHR5cobDZsX+SFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763197255; c=relaxed/simple;
	bh=Z1mPo+ebBiIP0/K905Xag3aOH9G6gGBxOg0SUmGsa8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cy3Tsez9gknQkRP/PS7LtkNVvyUxVi1M+Pv9Oddl/bNUc7k/NPtgE1uFOHHJSfuNU5UTp/SAeqbtX9lWsxVWNWZ2Zl+6x4660lFaRGyCdkRdR860qs8MqTqj6NZQeDvH7TAY3fvW7k/w/8Go2OTqbD9Z4PUT5Zzi0pznyK5NQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaMAVAUv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaMAVAUv"
Received: by smtp.kernel.org (Postfix)
	id 0E4D1C19422; Sat, 15 Nov 2025 09:00:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B353C4CEF5
	for <soc@kernel.org>; Sat, 15 Nov 2025 09:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1B353C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429c8632fcbso1895418f8f.1
        for <soc@kernel.org>; Sat, 15 Nov 2025 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197252; x=1763802052; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=;
        b=DaMAVAUveJmz56y6FoXR7WyZ8+m1mQysAJsRe8kEy1b9nr7p1uhr9C15VRPcW7Kxfm
         nxDPxVKtKkmRYwsRvaJfuuk2GS2z3EROhLLefmRPVqF14yoL+aGNACSdQV+YCutvdpno
         kRUjqdwgCn3FxnCQ3dmIASkvSGv/jkobd3IjlqHPluHliutw3v7VF6c7rsP/KpGf+IAx
         XTMfSbCFcJvtP9bsaOUJSQrtK5FbHOHQtzQLftUI4v2JPplisArey692DA/7Ms98sH7p
         mNA5Svr++N7Tzb5MEV0r4e8Ug6W7NS11gcSR4UfbaprF1ws+rlY5pmgCDfmstOSQyZsl
         5xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197252; x=1763802052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYu6Ww6258/C+IrhaH6QoljlvoHD6unsroBSoJrAUys=;
        b=VS6C1lv7WS49OzT4MtsMqoqlyIpxqdA9YVUT/12vukw6rdPNp/5dSvnNi9uj8HqaGP
         hfsDCziMmB/+clKcFNLsszm2WrfQE2XayWaJ3zqmyL2TXVzSwhXoKneSAO3/xwFp8rRf
         XI301cIApZrnN8h+TjkOf/Wlb9SZLjwClUIixKH8lgdjTfVk5Y/YuS8iDS7IfERS8eGf
         7i+hNIkm7OBLFCKmYAR5iLzDtJRjUGAZoE/sKT8lmllgwt/aX0rIU7RFm5J2dOxK4Woi
         jxuh+0sV9kP9Qj7MDoJhhvpdnN7bVtUjEOqGBRR9kJaBQPKrExmDF9U2jQWpLcDO8zC4
         Kn6A==
X-Forwarded-Encrypted: i=1; AJvYcCX40dy+bDfvUrZ2vi3nUQ5RbMny4AwlNmth21htzOBhL7+QkqaI4Egpy5K+XiWMo2RHc3w=@kernel.org
X-Gm-Message-State: AOJu0YwVh6ETmKpohNar5/YrLrwhCLqbH4rVywgj8DwHFmBgXnWA7HNV
	PdS24XsAl1AEfHL7+j3rZpn9eVjfspDQr7uX/fwNGQLtPPtAmkqBoXSi
X-Gm-Gg: ASbGncupru13RSzDq/DgrZ7/OhTrnTQ4KiQngbIZ49i81dB6Lplj9WI8auWBSbLugi7
	DqCRFAanwagpBJLE+hP4EXwBLaiYKHuWQsH8QtipBstk8KSsJ61hXCvJE5BShpBz/8j8SWMEBHx
	Lcv4KZrp+vFVEtj1SgBN2v+yejhud9zxIAW3SZbZtqM+ewEaEqX0Y9aWk4ly4SYYOt+7Agf8Htk
	/J6PlhfkvPwEaHnRhVv68aeuTWa+9N8SmkHOYo6xeJoVDFgc8OlY9YfbsE6k2BpjWpcdNEXvMnF
	OLztD8rgZBsSf5bLgB2If8+jBImzXlbL8FhgBYtrjEp+GqQxrlnxz8TMC9wAKTjBcilDsFqIpc5
	nxcu9t1TACUnUafO+vF7nYngysBqPRXu3wXsNf45US7b2UsixVs2JX65PbMHXJV9BtPRWXDJbwf
	WEZ5xZsCXTksO+S5te/nr6oz+aoEJ9H4ZauNDPEHykgxLLGrGtfhxhmL9U5WHo691rsrfG7Bxcs
	laQw4o=
X-Google-Smtp-Source: AGHT+IFdVfK+Shdttqb57lRCPUmJfMS313dD54S7D51C4gzOhgy2szla9wVkVMN99ItzkzULbuEs8Q==
X-Received: by 2002:a05:6000:430e:b0:42b:39d0:6386 with SMTP id ffacd0b85a97d-42b5936796fmr4919296f8f.31.1763197252125;
        Sat, 15 Nov 2025 01:00:52 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b617sm14666449f8f.31.2025.11.15.01.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:00:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] dt-bindings: Changes for v6.19-rc1
Date: Sat, 15 Nov 2025 10:00:37 +0100
Message-ID: <20251115090044.3140331-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115090044.3140331-1-thierry.reding@gmail.com>
References: <20251115090044.3140331-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.19-dt-bindings

for you to fetch changes up to 905f0dcc38f8078f0641c5cf855f420d78f10ea7:

  dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller (2025-11-14 19:31:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.19-rc1

Document various new IPs on older chips, as well as some existing
developer kits that were missing compatible strings. Add power domain
IDs on Tegra264 and wake-up support for the XUSB controller on Tegra234.

----------------------------------------------------------------
Aaron Kling (2):
      dt-bindings: arm: tegra: Document Jetson Nano Devkits
      dt-bindings: devfreq: tegra30-actmon: Add Tegra124 fallback for Tegra210

Haotien Hsu (1):
      dt-bindings: usb: Add wake-up support for Tegra234 XUSB host controller

Svyatoslav Ryhel (2):
      dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for Tegra114+
      dt-bindings: display: tegra: Document Tegra20 and Tegra30 CSI

Thierry Reding (1):
      dt-bindings: power: Add power domain IDs for Tegra264

 Documentation/devicetree/bindings/arm/tegra.yaml   |   5 +
 .../bindings/devfreq/nvidia,tegra30-actmon.yaml    |  13 +-
 .../display/tegra/nvidia,tegra114-tsec.yaml        |  68 ++++++++++
 .../bindings/display/tegra/nvidia,tegra20-csi.yaml | 138 +++++++++++++++++++++
 .../bindings/display/tegra/nvidia,tegra20-epp.yaml |  14 ++-
 .../bindings/display/tegra/nvidia,tegra20-isp.yaml |  15 ++-
 .../bindings/display/tegra/nvidia,tegra20-mpe.yaml |  18 ++-
 .../bindings/usb/nvidia,tegra234-xusb.yaml         |  31 ++++-
 include/dt-bindings/power/nvidia,tegra264-bpmp.h   |  24 ++++
 9 files changed, 306 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h
