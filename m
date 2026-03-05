Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4637346773;
	Thu,  5 Mar 2026 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749525; cv=none; b=hWxfDFjIbd+rIFsCbBRf/bjl790d9cy7tCucZialRI7hKamgWUn4shlQetcxj/9B3GEwTvgeDIWQfTmi9z9zDOHlKzsJwvkBwGXUD5FBBnboGfAVDVbE+tqJoGZUBnQau/FCCaPFa84S3LoznA+TIQ7vQVqtVinK+4rP/wsNMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749525; c=relaxed/simple;
	bh=M1XQ6GPIPdpR5MeXci4ZnCAHWBSdef3r642MG2Lpw68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TUxSBA5dCY2mdNtw1mjzUWx2Q9Gr3IggxfWzk2AQRXGRzuAtwiZWwVORFuaaoIgzhakH2wvdPBH5ubsgp6TmnIcSIWDAEKulkCySNP/LXYR4CQBeCr1Iipyp37H2zljJtIfRG/OSPBZooXqzj4kgEj/3GhCizu86H63qhwUwPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TY2ObdWe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TY2ObdWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F70C116C6;
	Thu,  5 Mar 2026 22:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772749524;
	bh=M1XQ6GPIPdpR5MeXci4ZnCAHWBSdef3r642MG2Lpw68=;
	h=From:Date:Subject:To:Cc:From;
	b=TY2ObdWeT6qjYHC0ZFyPdxCgF0HtRJeIndNGH1ffg5Lh/468BnncTSiAKpf3ovbnr
	 o8q3JJ73aJBYMfJ+AF5wnRSnBX365ZAt/xLv89E1AaLQRGw/CP7i81i8tZwVtAphEw
	 p9DJlrEF8MWpmC8EJSK5t/cp2adGEf6k8HIV5x4UyZzsmC+eMVS3tFGIFq7QuoIkvP
	 nWTjhGcGtC1bvgaUu06uYWwYED8xL/dY/lPd5PBbFpkY0HpJsbJPMfOKecS6J887Dz
	 Mp7OJZESw6+vDOZRwHVQLHw1a56F/jG31PsNEjltDwkvK8tJVDW10nabe6ytmv4DCD
	 cRz4nuttAbOKA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 05 Mar 2026 15:25:18 -0700
Subject: [PATCH] ARM: multi_v7_defconfig: Drop duplicate CONFIG_TI_PRUSS=m
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm-defconfig-drop-duplicate-ti-pruss-v1-1-2839e3b42a8b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBA0as0s3YSqNaFVzEugBnqGKWEgcak6
 d1FXb7N/xsoF2GFy7BB4VVUltRhDwOEu0szo1A3jGY8m6OZ0JUXEsewpCgzUlkyUstPCa4yVsF
 cmipGezKBJnLeW+itXDjK+/e53v7W5h8c6jcO+/4B3UyVvYkAAAA=
X-Change-ID: 20260305-arm-defconfig-drop-duplicate-ti-pruss-f140cd5dabb1
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; i=nathan@kernel.org;
 h=from:subject:message-id; bh=M1XQ6GPIPdpR5MeXci4ZnCAHWBSdef3r642MG2Lpw68=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmrmC4df/xMxTD6wfHp0tHpO7SD1mZtm7sj/NZbnwubr
 6/OMK9j7ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATmTydkeHrkR63lFYbSUGv
 YN/bx56oKXucv3aui/N4SvViZd41aY0M/2wFp85ZZRW/X+nVXB57U4Mj03malFPNOD8uS9k52Ss
 4jxcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit ee1ab82ee032 ("ARM: defconfig: move entries") added a duplicate
instance of CONFIG_TI_PRUSS=m, causing a Kconfig warning:

  arch/arm/configs/multi_v7_defconfig:1152:warning: override: reassigning to symbol TI_PRUSS

Drop the first instance, as the second instance added by the
aforementioned change is where savedefconfig puts it.

Fixes: ee1ab82ee032 ("ARM: defconfig: move entries")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..70d05f74049e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -279,7 +279,6 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
-CONFIG_TI_PRUSS=m
 CONFIG_TI_PRUETH=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260305-arm-defconfig-drop-duplicate-ti-pruss-f140cd5dabb1

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

