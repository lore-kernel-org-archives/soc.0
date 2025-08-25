Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A951EEBD
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 13:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756128341; cv=none; b=L38PGcaaznDjL0EuIEWRnV/gJElS9wl4QcySKp+WW9QVHaPI3ExRkkPA5poPa7w0Cfi0ryjy7+3h9oxr5uUIFzJja60iZV/w8BUF4zQ22DTkOOa6iXfefEKhiYSOz5Cp6qV4LbN1OOkK9feNYPCdObEe6wTBmT5+/Jh840+Bv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756128341; c=relaxed/simple;
	bh=aDkMQ9bOVnOaD9Ibw67F6Eq7uLk+0ksriwCUYK9VkSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRFl0th4LP4QrIlKY/eO/sSxAYX/x5I/MTWjuYXJ8E7uzBsupV4REJ/44l326FIJ8Kp5xt/Ra+DTb83w7VkQJWONuDDiqI37Y7yPQLVUQhWA7ENTGwAF2kaI1zmyZy/lLdTuTsu+YWZ60PzmUsB2A1bTtz0IBbHhYjTeQ1b6Jl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=t6jKREcH; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="t6jKREcH"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=816; q=dns/txt;
  s=NAESA-Selector1; t=1756128339; x=1787664339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDkMQ9bOVnOaD9Ibw67F6Eq7uLk+0ksriwCUYK9VkSU=;
  b=t6jKREcHoyPnowvYWZzT69DqGkKsC+UqdA0gErySngYI2RjG3tGk+pz/
   pS9xevaSWuUEMN0pputSFEKB9xNQsQjILESJ2NfKOqYxQJZHj4Xs4UL78
   t861iLA+sHD8EgQVviNFakIY2xgbGc7XGjy7jZjFDKkdxPGTg52wVmJp6
   XiCAfJ5FiurFAOO1QDNdKkz3EtrVYA9r2x5v4M45jNrFwuPAXYYKqqKc8
   1PrWAJlCDqvc4jnPtBiv3mnXQYBCFG56eyG0wIcSZ9ROsDKD1XPfjWy3r
   72mOVN/jLmgBf0furMhC0j33JHf4nG7o0iG+RhJfrLXcj2JUmjIPnFV86
   A==;
X-CSE-ConnectionGUID: VBOi1JBIQlKw3kEf9GWATg==
X-CSE-MsgGUID: bpcrGjXVREG5nu6XgVzEyQ==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31950003"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 25 Aug 2025 07:24:30 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 2/6] riscv: Add Kconfig option for ESWIN platforms
Date: Mon, 25 Aug 2025 18:54:23 +0530
Message-Id: <20250825132427.1618089-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
References: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0894 (UTC) FILETIME=[951F6160:01DC15C3]

Create a config option to build ESWIN SoC specific resources

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 61ceae0aa27a..848e7149e443 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,12 @@ config ARCH_ANDES
 	help
 	  This enables support for Andes SoC platform hardware.
 
+config ARCH_ESWIN
+	bool "ESWIN SoCs"
+	help
+	  This enables support for ESWIN SoC platform hardware,
+	  including the ESWIN EIC7700 SoC.
+
 config ARCH_MICROCHIP_POLARFIRE
 	def_bool ARCH_MICROCHIP
 
-- 
2.25.1

