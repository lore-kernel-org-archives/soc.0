Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C33B3EC808
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394948; cv=none; b=ZSERveQjtVMiV9rsdXw77JHFxnxO0uD5+py7sGsxp4hffMLswnMR1QWI2RHq0s5giiBV/K/FDrSFXODaUnIcY/ZdE2ERfmj6jDzZqgi3MeI9lsfejL/hsk/vtilDfSbXpyJA0EUnY3cq+Orsmz+iBnNRjp1witPA1Kt9ULsMqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394948; c=relaxed/simple;
	bh=SDlwZczGEoVSDdgAwWgm72t9tUC2amJSluZaPGFg/LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pG2NJTlXGXWV9WQkTZAttcch5XutVUrt39S6SRFt43k8IW5hZ5wLYrF/6qZpZDmOYJh6v2bJheVcYjiT4eqlq1/kv4OG6sjOyYfaBefxxiPDDeE4YQBW4CASC8OLL/7hHSWm5FOa3cgF8591OQoHKjqZC7xeoRo/gUiy6Rvau8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3dDWJ8g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3dDWJ8g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0191D1F00893;
	Mon, 14 Sep 2026 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394945;
	bh=WCLLZ89a7TBbsVin84dQ+duiXZIhrRmby328SRrFUN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S3dDWJ8gRKpyUP8Qh/5VuPB7y0jOpQPEGzhmo7lNc9ahR4dweAJg1AT0vuo1hjgDK
	 HU7j65QUam7j9GXjGDUrTW9qIcorzVID/BsKLsQ5hS9QB6j58uMtXdubdKC4Y+z7sW
	 GIAigjNU6+WB8fjqqTNzCNpSQmtgYfSPSLUZnFrmiPwZg8MYtWgREJa5J6BjhVQR6t
	 Wfi0rjxlUWMzbvi3uoVbEKHCq94GvSGo05CmJ9Imin8xilFuWO7DtzjLghrfbjSFrb
	 pD54a/iBuEgdqshUuXLWQ1niDgf57wiVad5DMHFBf7K0/8+fK5cnLLK/aDljJH+tdo
	 kvZsaot6fRCbg==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 08/14] ARM: versatile: remove Integrator/CM1136JF-S option
Date: Mon, 14 Sep 2026 16:08:10 +0200
Message-ID: <20260914140821.1805449-9-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
References: <20260914140821.1805449-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This one is now the last user of the original revision of the ARM1136
cpu, with both OMAP2 and i.MX31 gone. Since it was only intended as a
reference implementation, there is no point in keeping this one either
without the others.

The board support can still be built, but won't work with that particular
core module any more.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-versatile/Kconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
index 1ee9b6608d71..1bd83de55320 100644
--- a/arch/arm/mach-versatile/Kconfig
+++ b/arch/arm/mach-versatile/Kconfig
@@ -109,16 +109,6 @@ config INTEGRATOR_CM1026EJS
 	depends on ARCH_MULTI_V5
 	select CPU_ARM1026
 
-config INTEGRATOR_CM1136JFS
-	bool "Integrator/CM1136JF-S core module (DEPRECATED)"
-	depends on ARCH_INTEGRATOR_AP
-	depends on ARCH_MULTI_V6
-	depends on !SMP
-	select CPU_ARM1136R0
-	help
-	  This machine is scheduled for removal in early 2027,
-	  since it uses the ARM1136r0 CPU revision.
-
 config ARCH_INTEGRATOR_CP
 	bool "Support Integrator/CP platform"
 	depends on ARCH_MULTI_V5 || ARCH_MULTI_V6
-- 
2.53.0

