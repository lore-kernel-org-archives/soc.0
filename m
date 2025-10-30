Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331AE2848A8
	for <soc@lists.linux.dev>; Thu, 30 Oct 2025 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761852014; cv=none; b=uQyGiT43yPQT0amwXYfooqJcHprEeY0ZXzITPBJKPiC7hLzEh5P7qy13dDoq37sbl0Iln0LdcadRiJm8JwOW0u86XAHwSK6nPZfBZie9iXWZMHpztLDS6QNnB1lGeDSgETFyRiVxmeIy19bXsU3FMpvL5RQYy/7ZFdoW9QeQIMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761852014; c=relaxed/simple;
	bh=uvGLWAD7YvNIuJ0MvRPzwUPKzwhryoM8bP/baMyhO9U=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jwOLDHktl+gAZf9FhFC9oUddQhosI4oPfgnQ59dfbRRGwEVDE/83WgFMoSjvorrZUkGgTDMb2sEtcH7kgeWjBIAEwCBEEqkL7g7zAWYP+uwBBUUapvf6dB1GisbHn9smAhhNGfv1ucUSixYvGyqOqkSnZXRDsQfN7mLD52n3OPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRI0V+f/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRI0V+f/"
Received: by smtp.kernel.org (Postfix)
	id C78E9C4CEF8; Thu, 30 Oct 2025 19:20:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D163C4CEF1
	for <soc@kernel.org>; Thu, 30 Oct 2025 19:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D163C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4270a3464bcso1107468f8f.2
        for <soc@kernel.org>; Thu, 30 Oct 2025 12:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761852011; x=1762456811; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=;
        b=CRI0V+f/fSgBOsZGxeAQ/AARzRKpO5e6vmVICML4h2dSkZq1KELv3xWcJci8j4a1V0
         VcTjx7hzdfK8sZnCJHUj0cIxmXHczk/OD4YCC5+BDlfZDRKwaJK947IyfgcC8vlNfFpW
         0/ingfY10tTY8yHkjt8t+u24RoAPUHl6s7cLfsKHLAhUkE6LkKaBhhDFS6JEQ88HKnEa
         xtdBu9HauVJcsqpfFtHIQQ9bL5YK0rni+FLLRLU+rZCvozzLJ8VUC0OHD5nhioBBvIt5
         Rn8C/3Sj5qPAVgwvwAX25X6E5Q2E5YBhMNYMEIp5Bsy64WwOuSi2EcshUCosSQDB+I6k
         dRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761852011; x=1762456811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cyBTO8M8YFuORRFk75Qrt/oRKDykE19qoN11SVtGXc=;
        b=M/qZKqsRe97e9dhyZRg6DY68FQNixnbBbDytDHXrciuCD+BjIkVG1DU1nUbfBqB7rf
         N5rcVZjwcOV1n2YeB62xxxWnM+zFLDzACuwKJCDUEWrwoIbjdh5rMKpIiwCbkEtzQK9q
         2pKNlIca7pRVNc/usqE+vhkryftO+LM/bVCoBET5UIYCresKNPLKi0MRSG7j4/kEEu70
         rCKwu7oZX+6HqMzS3YSPEkA7zkdqMcPyxlzjoqTGmhNkdRIT9ppF0vx/WQkb6T16f0NX
         BBXJMt8qW4PSRYk9Agpu9619795E1rjzJWAJF61lQd6JNpgv2VZlY9ju/QJzdMXlzpc5
         0H7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAVi58G8BFkTiSBgg7cTrkkkmX80XCkh11GTtTXi+G3hc77sGPOtx42GlCc4ZhAh4S1So=@kernel.org
X-Gm-Message-State: AOJu0Yx2+uYAz3UOFOrlzGZP5DcIuCt93jaDbLscokStpGvjW/DAKF7Y
	qMZaeNdablBW8mbe+IxZu73kaZPWFHlIeMDoYDO6elBKbH2A8nQWK4cj
X-Gm-Gg: ASbGncvc5bblxkoDD3kGnrGw6qSqsMquwn6Uj1xXWLPPIwvz8kD+Tag9sR4LypmmaV/
	Pta9dD4aEazm+eyINVIXh7pCfgG4yqMSrIvZPBsfDnYA75YI8+tWdqgH/TBaL9iCOpftG47kUPg
	VpdKo+yc035BUvGfm9+kPkcrSWxjWVqvYGaugtrMlTHb3s6XBO2YdmzOFGEwh7VjE3YO9+slf05
	iV45bbNItjkEGXtGf7XAlxV5Bc86QUI9fsDpTnrrcEHAVzro5MfywfbKKanlcPMmSrQKS13y1sD
	Ct8L3TvQNMWSxUkTrNYmuwbMFRBYH4bmRGAGSH5SGS2+FF8Q+xIwkEekXuYEsE3mhcPl4JM7VTX
	7uYUaBpEPXCpos2Aq2sSAPxhVhpCyRIo34wR//dBWcY+87bxd89wQeSiViyppGpRmlqoucPhiyc
	yNKsdQ1bAOy02HF2rpLovujFVmbYLL7RThO9XWROnLUIsMXRn2RwwWMNmQu5ifF3XiZAtIbF6nc
	q3DPqg=
X-Google-Smtp-Source: AGHT+IEpSsbR8IVq5Rq4mjP5qqKpcNZKCRQg0psZEZaYxRf2iVNkAiJuhW6XE1AiPQEiDp8LTtGU9A==
X-Received: by 2002:a5d:5f87:0:b0:428:55f2:be4b with SMTP id ffacd0b85a97d-429bd6a4c29mr760402f8f.38.1761852011071;
        Thu, 30 Oct 2025 12:20:11 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952df473sm33477601f8f.42.2025.10.30.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 12:20:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v6.18
Date: Thu, 30 Oct 2025 20:20:02 +0100
Message-ID: <20251030192007.682116-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm64-dt-fixes

for you to fetch changes up to ce121914f38aaa59504e20a1a625e5988fc6ead4:

  arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source (2025-10-16 11:49:08 +0200)

----------------------------------------------------------------
arm64: tegra: Fixes for v6.18

This contains a simple fix to mark the Ethernet PHY on Jetson Xavier NX
as a wakeup source so the device can support WoL.

----------------------------------------------------------------
Russell King (Oracle) (1):
      arm64: tegra: Mark Jetson Xavier NX's PHY as a wakeup source

 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 1 +
 1 file changed, 1 insertion(+)
