Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7994923D7F7
	for <soc@lists.linux.dev>; Sun, 18 Jan 2026 08:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723399; cv=none; b=Zdz4pqu5VaoyKkFw0na/g3JMpH6VFYlZsI5RMCC7bzOifipWm17WFtbX1PFY0uJ0GdEipc/gE0EJDF/5KcxDB1+0ITKP9hrCdHbGu1rE+OwSwW3V/x+o5ICuqO2NNmW6Um0GMOujiVTDwhf5RTTjWGLDjVYsT4Y5TdsCVuCe1+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723399; c=relaxed/simple;
	bh=BmqW9qasO22gs3uI9qJ4KhDesE/yCqRFybixcoASBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mdp+fZElRqACZPorPe0gu7MqTT6v8kiLH9ZbOVWLIok2Uwlx7ttTAte5QZWh6/VX/MxokOjh00YoTkeVaQ19uWOL/E8ACGpf3ET8qFS0nEL4VNaixJihGLs2LdKO+EokvoRarsU2AxffSKkp8ikW3KtcaP7ZECOko3r7vvLO8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1j2LQYv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1j2LQYv"
Received: by smtp.kernel.org (Postfix)
	id 397ACC19425; Sun, 18 Jan 2026 08:03:19 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 784E9C19421
	for <soc@kernel.org>; Sun, 18 Jan 2026 08:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 784E9C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124566b6693so2120999c88.0
        for <soc@kernel.org>; Sun, 18 Jan 2026 00:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723398; x=1769328198; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=;
        b=I1j2LQYvTkdXo5lfq1BYDpE1buQgu7a3R1ctZO9/X3e3qTi1Z0mehMt+XeBbdYSrxi
         b+bLi9Lw/7e2Mkav9LEAb8E4P4pst1nQVmp5Vr8ZzOsptozS159aJ62SWvy9hCfgzVo6
         pLJTC8HyirJCOMY/FcjWfahgqLZictBft6YQpMUShOSqg6PmBj3baXMlhRQ1Mn+nTr2d
         pPpvV794HV6y+GHdTg4xc17EyVSX7TtePRO0Z0dYx0CQyZcyrOoyGk1YxN0TjJFfHiPV
         bzfB+alpX3nVU/Ukb3O3seYzPWx24En45iuNG1PbZFts3ESIIABz9YjfqvmXwphQMKVU
         1MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723398; x=1769328198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xChtBKPsImfoi84c2WhbMuILCNFs4bzMlyLsBvJi1U=;
        b=LoQGH+OH7FARD7+aGj0X4QinmMF3HwlG2pQ2/5lHH/rrKRFBx7aXxgx7uIrl1fWeCL
         APuULqi3pjLzmRsrEPdP/3fL8J1zO6uopib8ug97gGcVbLD8nEXCGrFpoJ/oLXhrABPU
         gyBUlv8+WR+yfFeKAioV68UR9S1QhMc+bQ6+tKY3gpsN3PPaYoUsQGz6NWlj037K0I38
         eS8OzqXaohQEJWuQq/LR98ZqZ2EwhmPE23c7CFc/+vwfhceIgiDCBkjHuF0UzpBtrSlA
         S00h0GtzwaADSSgrDYLoZtKLeEJRr4DlHo3vm8Lb+E7Qk1kZuXEx4eGjwTSrQS05dSKa
         3wAg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxM7PlNN7mK465mpYgHFBCmSlgflIt+oqVvz61Tku+NUx+3EhoAxj+YiLeS9LHxTvhRk=@kernel.org
X-Gm-Message-State: AOJu0YxJWHvpF9+TzKJN0BERYu9gcLJ42l+ICmEQsSYcc8NWJn3TwQi1
	sDG8MlSOBY6BnrgpvllQYt3s7ce0Fj/lqxfQDYTIuoUdDQ9LVpMg5HPT
X-Gm-Gg: AY/fxX5aOkqNtXm5QIwFNqcc7pv10e2e/6Z8WEc6ZPE1ggCg27UdoAyw/th9LxLQ/6L
	x6kaZ8qSmb+TpgXVYHIFFcwba08u2nVqvOzUr0n/uqGURci42Mt/EuyP2ZpgtXedDy0k1ffTpPf
	nZ87rvKim8fE+omz1vT800a2hH+9KyDULdby//UPgY/VZ3ymVo3SlCzv6W4IKjQDm1sYUzfYshG
	SDkHfBKVh583zlsmwTZhv1aOtG8kzw0KOALqyAhjUxtRlYY7bCpU1ZITPNLqgWfK9bcsh3O9nQU
	YtsQxAckH9V0/2DGyZE8lD3hgMLU/t7Ygy5wR+R3AL7/djkAybS61nd28dVRJfoh8IW1PPVOALN
	Q7BITx1zkKcqI1Bs5m3k7BMg6ZmT10jmJELZXCr19tpuZaCqySmb5M1lwHLOcilkoMzg0Fpc9nQ
	Dmf98bXqOKSAuXb2M4rRs7+KeVTt2YJgW/rb8rZZU2g3qYHAi/dJIqZRyRuxlpSJ+/AYoxswTFx
	wwQr3c=
X-Received: by 2002:a05:7300:3254:b0:2a4:765b:b4bd with SMTP id 5a478bee46e88-2b6b5045f4dmr6001906eec.37.1768723397526;
        Sun, 18 Jan 2026 00:03:17 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a94sm8475422eec.20.2026.01.18.00.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:16 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:03 +0100
Message-ID: <20260118080304.2646387-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-arm64-dt

for you to fetch changes up to dfa93788dd8b2f9c59adf45ecf592082b1847b7b:

  arm64: tegra: smaug: Add usb-role-switch support (2026-01-17 01:15:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Changes for v6.20-rc1

This update improves Device Tree support for 64-bit Tegra platforms,
specifically focusing on the Smaug board and the Tegra264 SoC. It
enables full USB-C functionality on Smaug by adding role-switching
support and enabling DisplayPort altmode. For Tegra264, it introduces
nodes for Command Queue Virtualization (CMDQV) in the SMMU, adds the
Data Backbone (DBB) clock for the memory controller, and corrects CPU
compatible strings to match the Neoverse V3AE core. Additionally, it
performs a cleanup by removing redundant status = "okay" properties
across Tegra186, Tegra194, Tegra234, and Tegra264 files.

----------------------------------------------------------------
Ashish Mhetre (1):
      arm64: tegra: Add nodes for CMDQV

Diogo Ivo (3):
      arm64: tegra: smaug: Enable DisplayPort via USB-C port
      arm64: tegra: smaug: Complete and enable tegra-udc node
      arm64: tegra: smaug: Add usb-role-switch support

Krzysztof Kozlowski (5):
      arm64: tegra: Drop unneeded status=okay on Tegra186
      arm64: tegra: Drop unneeded status=okay on Tegra194
      arm64: tegra: Drop unneeded status=okay on Tegra234
      arm64: tegra: Drop unneeded status=okay on Tegra264
      arm64: tegra: Correct CPU compatibles on Tegra264

Thierry Reding (1):
      arm64: tegra: Add DBB clock to EMC on Tegra264

 arch/arm64/boot/dts/nvidia/tegra186.dtsi       |  2 -
 arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 15 ------
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 25 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi       | 15 ------
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 ++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi       | 64 ++++++++++++++++++++------
 6 files changed, 83 insertions(+), 46 deletions(-)
