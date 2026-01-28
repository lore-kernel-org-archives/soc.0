Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A90737475F
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769630312; cv=none; b=KPfisB1HJ1FjlHMp69YAdZsGVcPk1brVHPBOiE2np33BHPO8EfiY99a0sOvQgceqc+XjMUBTVULdLAVUF88leHLq6Y0eAY2CDEED/sUfu949B6ZIeMVVz1VSelhwy8+bAtF+IVSVTkuV7Csbr1IJeCW70+APDgFlH2OiPVjyLR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769630312; c=relaxed/simple;
	bh=2u9vrs0eCCOkG1pVb3Bo4g1oedoiQdVq5BXcaCwW29o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sE+WJdNxU7FEa4ah5GWuJLvCtFuQHd7f8SwRcpTO9By0fjSyzg2VHa1T1rU9ocQltSI47vCjEyOD3Wkn4qyQjbQPSwiwm0wT0jiE0IcXIp4xMcHHP1L6xzKz2IDpGe5lplL+r3m0829JdbJM3fIeKRY/LbwO8W3MG7EbisaFmww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsQlvHqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsQlvHqI"
Received: by smtp.kernel.org (Postfix)
	id 34429C116C6; Wed, 28 Jan 2026 19:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2704C4CEF1;
	Wed, 28 Jan 2026 19:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769630312;
	bh=2u9vrs0eCCOkG1pVb3Bo4g1oedoiQdVq5BXcaCwW29o=;
	h=From:To:Cc:Subject:Date:From;
	b=hsQlvHqI24ZQ/nCVPAJVyEfVNbX7qaNCBjAekcMUB4q/xgrWPJMmDxKKixJHC7dWg
	 TaMD3//YmbWqOh+UVLiTfgzYrqEza3zL4IV39LndRbBWgLr8OaDHKtFpjsfgCrM5uJ
	 HWUbSAmEw4EPQU+ygB3+UrjwdCt5v973tTW0iClz3qJi3SfApKMZZnTGCh9v96k/m9
	 7DtiNtznIjQkEMqksd9Zq5K9m5Z915BlW94kCYNcTNlys8QFFChKkpdWQbe2Pa6T3f
	 5RrPxO7Yh0QtsIBJZa2BHOQkBFOFybFTg+9j0BhrAejtVdchMxNPMtyGWrCDqcXgvZ
	 qlIBXuaj/XqOg==
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Yixun Lan <dlan@kernel.org>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
Date: Wed, 28 Jan 2026 19:57:42 +0000
Message-ID: <20260128-sitter-crazily-184c1a7606db@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NHofa630THyYfy8eUl4FpqpXtkYodnCIt2Ov2xpSTzM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlVWWYvQv4+NZ+W16f+5512/5uqLTzzN+dsXiYheEfsh ES+oeW6jlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEN5OR4cqdLAcV29aEHznC c/O2ZiyY/cHfm0u4NrCdzSV/4pUntQx/Rf9rvYjt/Xy0pXXagjW7sttFCo/ebDiX9od9ubGjlOY fXgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Yixun Lan <dlan@kernel.org>

Enable the clock driver support for SpacemiT K3 SoC, configure it as
built-in by default, but users should be able to change it as kernel
module if needed.

Signed-off-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

soc folks, same deal here. This is the only patch I have for defconfig
stuff, so I'm just forwarding the patch.

Cheers,
Conor.

 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..6ce600081a6b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -255,8 +255,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
-CONFIG_SPACEMIT_CCU=y
 CONFIG_SPACEMIT_K1_CCU=y
+CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.51.0

