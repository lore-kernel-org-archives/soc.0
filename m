Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721527;
	b=J7ycE6QGR5tMlzMrNmbUkVLYj3KgSTVYvR7qKNLPXSSAMD7Fw2hC+P9Wd24Kvg6MMGnZ
	 0uHoKtZsmpdMCYWKEZV7ajD+p5RoicGtTyu9FCuRBXTOXA3l4+GZxmEJHnJFsJw2yW+z/
	 qHqhiUb3P50+sK9cjhZ+SOpaMvcjSIcRfG+C8TKA91t1hm6TGEOdNc/RNeOtEXEIq6wHj
	 MJANDtr2xXQdWiKcpWqXIweHDOz6f/dqoi6YrvNT9LWqE3VfkHVbAPEOclO9Q1xXo15Wt
	 Rn99yL8RMajObxeIoe/7GIuZ4iM0ootuMRPZGd/MMpIvKZZpQvo9Jz2UOoInS81LvkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721527;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=buJkffQhJO3hc32EzrqEjXjQ+tCma0DtcEUUCUlPmvg=;
	b=4INZ1RsAnH47jkCt0mFnE1/Xek6z7TAKqRuCjgkKJ0o6iizsi1qqo9EC4a3Yo6rzoPeb
	 sv8FUBIO5GwRxIKXNeZB1ej5BvfnXgsd3OWYEGuOCtfBoWaWc9HYov1Ill9JMyrgPxYvp
	 sC1hEqPoWmKXGxdaspo6iqQRhq3/QAs04wzcdvcRW6WhXuDHsfOsXrW6NE1KJG3lRc5h4
	 BlutPL+2SiG08QQzdDe50pl3AyXFQIl5tOfK5YCZxTG5rFNDstySDy9u3WXVST+AZ+zia
	 dkIhhEtc3q7oxj8KovXdExgLcME/82zPfsTxxeJtpKDhnepb7u4iZHPTU6xbq6lBXrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDj8K+qy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664BC606A323
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDj8K+qy
Received: by smtp.kernel.org (Postfix)
	id D88E91F000D1; Thu, 26 Nov 2026 19:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3081F000C4;
	Thu, 26 Nov 2026 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721526;
	bh=buJkffQhJO3hc32EzrqEjXjQ+tCma0DtcEUUCUlPmvg=;
	h=From:To:Cc:Subject:Date;
	b=nDj8K+qy0v3yTo1nY9tUJM7lu7aZgXR7RFGfFGPoi5Ry7AUiAFakrfGWX5Rp9BfdU
	 6ebEjiQgH/pJsAIHGw/tkDYY0UEHlwob7SudhSoO7zUXOFRZ26xhwvemiDefuuMX2E
	 /EyBT5XaURx8wEvnFnQOij4f2gNaq2q+VtMGzSZmKxKW6qQgogic6V47Cxfk5kbXEg
	 2CF8BovIbAwywecz1nX7WnU/8fPqyWHop2phkc3VkibylIEVvttC74Tl7+VD0CWoiM
	 b+sD8++SdHbLe34xjTJYxYTQ2TjxRgu2KCx/WkKEhx3neFr9w2CTj2gc08LQs4WqAf
	 NLZH6Qagr+2zw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	Benjamin Kelenyi <benjamin@wendy.sh>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.4
Date: Thu, 26 Nov 2026 20:32:01 +0100
Message-ID: <20261126193202.6214-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.4

for you to fetch changes up to 67b58fac77db8d2653e53266f62964cba96397fb:

  arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil' (2026-11-07 18:49:24 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v7.4

Mark the ADSP remote heaps as no-map on Agatti, Glymur, Kodiak, SM8250,
SM8750 and Talos to prevent the kernel from accessing memory assigned to
the DSP, which can cause external aborts or resets.

Fix the Glymur CDSP FastRPC compute context bank addresses to match their
IOMMU stream IDs and avoid translation errors.

Remove the undocumented and unused WCSS PIL node from IPQ6018.

----------------------------------------------------------------
Benjamin Kelenyi (1):
      arm64: dts: qcom: agatti: Make the ADSP remote heap no-map

Ekansh Gupta (1):
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

Jianping Li (5):
      arm64: dts: qcom: talos: Make the ADSP remote heap no-map
      arm64: dts: qcom: kodiak: Make the ADSP remote heap no-map
      arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
      arm64: dts: qcom: sm8250: Make the ADSP remote heap no-map
      arm64: dts: qcom: sm8750: Make the ADSP remote heap no-map

Rob Herring (Arm) (1):
      arm64: dts: qcom: ipq6018: Drop undocumented 'qcom,ipq6018-wcss-pil'

 arch/arm64/boot/dts/qcom/agatti.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi  | 14 +++++-----
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 49 -----------------------------------
 arch/arm64/boot/dts/qcom/kodiak.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi   |  2 +-
 7 files changed, 12 insertions(+), 61 deletions(-)
