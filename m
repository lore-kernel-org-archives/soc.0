Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577A81D619F
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752271795; cv=none; b=eR3sABa6nYKsfISNhFHfVZ++GCMcDqhNkcE8zb2gbqeqfXHlYFBIpeo1GlIz+lC+DU8eH17dUOkOl9cfuE89OhtlAFS7cDOmOmrY//GNmdnyrAzGGNf7YUJhoWkuM4kbr67RD3KB74e8lmStgI/9vSp10UmKrKq3RbXU8vBbeHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752271795; c=relaxed/simple;
	bh=twQN4szJviXlTffWihCZFgvw0JCyvnr9tfOri3i8sqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0vq2dKeKphdrZRJRgYVWnyamC6PByecoHTMKj2uw40eyvIvw4dczQ/u0HqM0k7CWEG4F0/0Zmk/4yL9wxNv0cMeZn4gGF5O/pztgQfrp4+zGZG8e/z00PVBFgf43rXcT+R1bz/OV3T18VFKQJCumAlTzmTOnRGcSV4bOpvRWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6twf/m8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6twf/m8"
Received: by smtp.kernel.org (Postfix)
	id 03463C4CEF4; Fri, 11 Jul 2025 22:09:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 246BCC4CEED;
	Fri, 11 Jul 2025 22:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 246BCC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so22393095e9.1;
        Fri, 11 Jul 2025 15:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271792; x=1752876592; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=;
        b=a6twf/m8g8eCRg0EndPzH8Wy2FpUDXXQcQh0dL1Fer8XZ1mL5WnWR6ZBt6w1lawg86
         OdSvv5siOZdJ1BayrEU/Ep2qcpNnsgxtuEPTi3BvchjOYmBdPbXBPZR2y7aNLdItMlCz
         deGS7beBXmLKhjGKwdvS+aji2KbrcNv3bUycDHSJUdn/+N7jYW9EUUOlySrbJvpf3bP1
         Fm1sUoQyssCYzSM+fNDx1Gs0fsY2g8E16uqk3gnjzIAGMTO3p3lF47jYoTzOm6fqpc2k
         TJhI3NEyM3Dyj6fBaTd3M98HkNUTv7tT//wgB39EyIuZvyqh4zHf3d3Be+O8h3c2Z0Ut
         jteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271792; x=1752876592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxlOt1TcvjnPL+nIYmbqEz8a6dgQfeyHjwXGW8M0Duw=;
        b=l+Kz6o1u4AgMe0WwCJtMLlp4CJ/7LF16MeNZrZVmHk22+wv/F5g5JkwwewulDUBiPE
         KMYdjzGXlsJdvw+dQFFUaJKuisdBhiGJxchC2UvV+ODqba8EhKfUO9jxYNFhGbzR9aAk
         O7oNcjx6Yo7VsslHueISbZKLI7wIVGaerX7n6SLt+aIRC6c97HQFus3LV02zXrEql1YF
         CiEA/TlPaTNRw3r2cY2CJ8AfCVC8t+zJc0ZTS+TvhW5I06x1/vKQVmIuAGhPp3p3l7z+
         9AwZsFa6I3FG2r3FmIoNSNGP+4TJ6j9AKtM/4NyI5YHfZ1KgBF5wkECQ3bb+/+4LFZlu
         +dMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0K0GVIyFG/p4wCfaDxwMWXDhisuktexcK0WnJNxE6e1/th7L3eDTUxKh349r622TFxnE=@kernel.org
X-Gm-Message-State: AOJu0YxFAZCSLmXj4jGHFoMN5qmbOLgoYDaoY9DApbtlIdlViAzYrLbf
	+R1EnKyJg/em8AoJ4B388xgzlQNtYnY/BCacwmdwNfUpBuWpvwvEHWR1f3u/HQ==
X-Gm-Gg: ASbGncuP51oXVGa1oQ+/x3eVPqJ6m3fZpjc7HkaHuTpO0YPhjciP0xFdTsaXA+BYm5+
	MwEZjW3uTVNANM6bnOVx03RxuXHdAAH8IjOHuZ00Aav3YudCP0Veq9de7O/WuIrUy0JTU7HnFuK
	fcy9BqMyAnsoQf0E1wzHmA6Z6Hxu1gad2zLVIx7NqpsDISnrDoPOanB9uv4Fae5sA1HpRrIW1rz
	AysvANQCqEQ26nE+n2+sbI2x9YN/VrJvarncVKrPzS1wrCMhpyLq+L46F3dFqxdESukuyWX65eE
	DNCTBRo2bjpqGLlZFcMzqh4Te6IU8KrZ1UqMKlCipwOduxn1AuXv/rmvoC5Ji7DXpx2oSYzcY2B
	dKiEBRWjGDvcSHuFYaq9HQO8dOBxsO8NisWv+enNelHE2OPEmhAG+VRc9WswmOBGGoe9poMiJ0a
	FkS2LJCIQswt4wog==
X-Google-Smtp-Source: AGHT+IExZjFpIAcWoQpl+VbmWsdNzvcMBIOoWZxuJvknKQKNhrZ/J+dmt8K8Q4OF5msRFOLLDCGpUg==
X-Received: by 2002:a05:600c:1d20:b0:453:10c1:cb21 with SMTP id 5b1f17b1804b1-454e2aeec43mr51634295e9.8.1752271791612;
        Fri, 11 Jul 2025 15:09:51 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d5easm5540016f8f.48.2025.07.11.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:49 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/8] dt-bindings: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:36 +0200
Message-ID: <20250711220943.2389322-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-dt-bindings

for you to fetch changes up to ad8247beb4c45acd29ded24c8e956bb96ece84d6:

  dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T (2025-07-11 17:08:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Updates for v6.17-rc1

Add Tegra264 compatible strings for some core components and extend
bindings where necessary to accomodate the new hardware generation. Also
document some new platforms, for both old and new chips.

----------------------------------------------------------------
Maxim Schwalm (2):
      dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
      dt-bindings: arm: tegra: Add Asus Portable AiO P1801-T

Sumit Gupta (1):
      dt-bindings: memory: tegra: Add Tegra264 support

Thierry Reding (9):
      dt-bindings: tegra: pmc: Add Tegra264 compatible
      dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
      dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
      dt-bindings: firmware: Document Tegra264 BPMP
      dt-bindings: misc: Document Tegra264 APBMISC compatible
      dt-bindings: dma: Add Tegra264 compatible string
      dt-bindings: rtc: tegra: Document Tegra264 RTC
      dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
      dt-bindings: Add Tegra264 clock and reset definitions

 Documentation/devicetree/bindings/arm/tegra.yaml   |  13 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    |   1 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml      |   1 +
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      |  28 +-
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  84 +++-
 .../bindings/misc/nvidia,tegra186-misc.yaml        |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |   1 +
 include/dt-bindings/clock/nvidia,tegra264.h        | 466 +++++++++++++++++++++
 include/dt-bindings/memory/nvidia,tegra264.h       | 136 ++++++
 include/dt-bindings/reset/nvidia,tegra264.h        |  92 ++++
 11 files changed, 818 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/memory/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
