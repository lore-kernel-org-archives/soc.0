Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725800;
	b=rBmnhP9BcVB0fTaG2t8qe+MRnLBaJdscronYKCEkrMiL5cXRiIFTmeknj0Te+Cr0dye6
	 1XfUSJF8dBQDhP+xPHR0kc8gxVuenKgM7oRbLz47IYE8HTy0/u5aMXS1pGKO5FS3XZDuo
	 pOqmYqR4SreYt5yOZynKAeJtrYgGcVyCp3noOkITj4AgrD4jwQYdizQv6dj0BKSIn6OEF
	 5WHjrITJyoGPU/xzadrwKYdHW7P2Sn2hQiL7raTb5xwPQ1K3m90cMaYhmOQ3JJ8ywssZS
	 4x5S2MrhjnnyLXsM0xwlD8gz7SFrru0UZp02AIywG1U7XlZM7z9EBfq/AGwGm0ng7jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725800;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bM3ZC9yu5XH+6bnUPNa+jdnnx+eGcgI8D08Xng9WN8E=;
	b=JquIjdoqnpoErdwon8eYLHSqDuIjHtzgEnBRJz7r+r5Q18A99UQIdM2/36hOS3GQ3MWp
	 VyIL2M2ebBwiY0aNkJj2PjYtFsXgkoqEQ/YxTpe6LQR0UrUkXtyO4Lz4XnP009k/X831V
	 zvCofXG0UZAPlxTankytvFg3HwD1ytwvwJeLr68/sskbOC+SiMZcapnI2pPRt7paoHxuc
	 K5Gz/N+EIhmKqbGmmJeVef6Jtc0rWK67yLhixXw4nKkUW6xpGA29oTDinKmHQBn20fPVX
	 b3luXJTQKNdoS2lpn/19dfn1Hb0mzbazhEF5w/ZEvKWteGTUleKQQ4ZS0FGefCM0zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4EKObBl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B2606A691
	for <soc@lists.linux.dev>; Thu, 26 Nov 2026 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4EKObBl
Received: by smtp.kernel.org (Postfix)
	id DA8E21F00893; Thu, 26 Nov 2026 20:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0151F000C1;
	Thu, 26 Nov 2026 20:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795725799;
	bh=bM3ZC9yu5XH+6bnUPNa+jdnnx+eGcgI8D08Xng9WN8E=;
	h=From:To:Cc:Subject:Date;
	b=E4EKObBlHAmUhpLsKjFSdoTnJ/NhxM4BCRxUirL8IM/r8aRM54FYAKohozTrB/b8d
	 Gt8z30g7oTksu5eXkKgQwu6huQiIlmwY/iNFySnXKNCe/0R9D7GHA9zLjjGhaMi1HL
	 7dojc6kic9Lsr/7Meu28a3snSU2Um9C6FQ1TJ/7UmiXlAZwNlo/9BINH6WsYdmSRox
	 YQ5ReWJEky8t5tNnp3utsZ9IYLWzikSluFxCxDdn77yaZ93Bq6AkRxQRhdIOHi3Fuh
	 5Ba0pDIz/2DvvMnjQwQSUbHJJLLaT9MrmK70uVVT6/Wtxg09UPIMS1FQbRg9LdUvxK
	 15T2Yu/7BA7Bw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arpit Saini <arpit.saini@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.5
Date: Thu, 26 Nov 2026 21:43:14 +0100
Message-ID: <20261126204315.15005-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.5

for you to fetch changes up to 1ff72de9902a955b8446bba2c56942028c1425ea:

  arm64: defconfig: Enable Novatek NT37705 panel (2026-11-16 17:44:40 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.5

Enable the ILI7807S panel driver for Shikra CQM and CQS EVK boards and
the NT37705 panel driver for Fairphone (Gen. 6).

Enable the PM4125 audio codec for Arduino Uno Q and Shikra boards, and
the WSA885X amplifier driver for Shikra boards. Enable the Hawi LPASS
LPI pinctrl driver for Hawi and Maili platforms.

Drop redundant Qualcomm SoC and interconnect entries covered by Kconfig
defaults from the ARM and arm64 defconfigs.

----------------------------------------------------------------
Arpit Saini (1):
      arm64: defconfig: Enable ILI7807S DSI panel driver

Krzysztof Kozlowski (2):
      ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      ARM/arm64: defconfig: Drop redundant Qualcomm interconnect entries

Luca Weiss (1):
      arm64: defconfig: Enable Novatek NT37705 panel

Mohammad Rafi Shaik (1):
      arm64: defconfig: Enable Qualcomm PM4125 and WSA885X drivers

Prasad Kumpatla (1):
      arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver

Srinivas Kandagatla (1):
      arm64: defconfig: Enable pm4125 audio codec driver

 arch/arm/configs/multi_v7_defconfig | 11 --------
 arch/arm/configs/qcom_defconfig     | 10 -------
 arch/arm64/configs/defconfig        | 54 ++++---------------------------------
 3 files changed, 5 insertions(+), 70 deletions(-)
