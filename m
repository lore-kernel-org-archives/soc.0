Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370D18EFD1
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742247393; cv=none; b=L5oPqw9ycYk8cV6eImNny2sitMpaEIVPEcp78SpCMktiCutWKql3w5968rBGhAkZud4sW0O3dv0BLVmZHEZOWesYJ66yuL3BaGorCB70z/QHdkXnmhD1hA2ESWgCX1hVmH2V72pRh7TP4TscneJjMNqGNY4yGNGXHbJKeNJfVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742247393; c=relaxed/simple;
	bh=7oJ67FGuy24OY5JnIvvaiToTkGVyKeKv7Zed5BlGRqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iudPfQhhfQOVpkcTUybt5Z9K+xS4JtFC/5+D9IT+pmDrejfNFlsxCidZctU4KuAcuPi50jSjWr2hdd/P0pzBzOxfl/Mh96Rcm63ZkqKpOhyE8L2NbXKkXMCg0XtSd3WmgCUE/7Or3mc6SmIOM1qH2zvP3mv9Ge36tvgtOAyFHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwO+IchA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwO+IchA"
Received: by smtp.kernel.org (Postfix)
	id 9B1E0C4CEED; Mon, 17 Mar 2025 21:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7ABC4CEE3;
	Mon, 17 Mar 2025 21:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742247392;
	bh=7oJ67FGuy24OY5JnIvvaiToTkGVyKeKv7Zed5BlGRqA=;
	h=From:To:Cc:Subject:Date:From;
	b=YwO+IchAy9nQp7J4ocK+lwOzNtG2/E7BCoqYK9kByGm8YBWx0B/wOehOeEDT3g5C7
	 iw1VDnzhyNoUg+wRIF8IHLAvc+DlD9k5J+F+aJ6fUKKf3pWNNBJDHvQH03aGX4u4Kz
	 Cy1zPVzF64PNbV+4LguSQfYOYgpvqAs/AohhKrDJLkdGEKT8rHZr7zPAxFCLxgXZjH
	 p1CW3YYKWDp5gGMJeDUcYI4vgI733eJy6nCponWYZzpk8yq/1pQY9PjHrko/Bh+sbb
	 /cstzWe0SbRGcL34Nsiy+SIbAEyu2kmlc/XCGNOLrXuA0SBimKlHqTZ8YROz7elJ+K
	 z0Eg0UjrSrRXw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sanjay Chitroda <quic_ckantibh@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.15
Date: Mon, 17 Mar 2025 16:36:30 -0500
Message-ID: <20250317213630.2029212-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.15

for you to fetch changes up to adbbdcf4b2d6556721b580385ba387baca5c26ee:

  ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant (2025-03-03 22:36:52 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v6.15

Cleanup indentation issues and a deprecated WiFi property.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant

Sanjay Chitroda (1):
      ARM: dts: qcom: Fix indentation errors

 arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 4 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi  | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts    | 4 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi  | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi            | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
