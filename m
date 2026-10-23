Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738173;
	b=kIvQX2GeDWAxS/U5wwQsz1c8aklNpbrlxJ52BZuiixn6Zie+Vhaz0b4WbAI4K2J5ByAF
	 BkL8ViyfGJ5PIQpe/Y+RKJFvRdqAdBzp1jxSo0DSl01Glsxa0qxA8bp8+GNHIE9OVhuse
	 Qu7HUkyHThQwItwBuSEnk/qBXMVfhjWWQN9E9CxWuCjzBoVR0UjH9d0ReGBQ2z/4n0SmE
	 ODNMTworKPSa4zy5Iy2/xmO5w2dieX/s1qyHAafsJJP8IEZyIr0xFbqWs2LeYhrHxoMNk
	 m9ZlwtBhH6xJUpckRp6TK49auDKVOZ0fmszC1l86nf5Z2SaXmoW9mlVxMo552KiI0AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738173;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=Bbup0xDfsHBOOfWlrbo0j1pUSl8H4qeOPTbrrQ/Kies=;
	b=akoBV5Jj0h8O9UG2kYSl2i3ulXP9NxWRsbhfMbEGruYqhd52/dZO8ss2DAWbCleBUsqq
	 1CSJ4CPxUshazZHJhLAAgpuPMrKdwO0uHLWDegPOBHwx1tYYX1q+GkwQ34BTloxm3pzP6
	 xl/Nw1VG84IHp+1scLLDck0hXdogPVD9elaHXal4XUtIbecCI15/iVQSSOsQvgT5BcWM7
	 sTfobfZ2R3ZDDrr4cXtMEGXdgVFWsxTMaJ0V6VTuBCPqpw3vgFBJwTNefgzib5YlXp2Gq
	 F7nqBkT1qa+TEq50L6rlmijF9iFAXJymkjWRY0TJuYZYQ7fpU1nwO6up7SMqm+s7gbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iV3h4q13;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52108606A333
	for <soc@lists.linux.dev>; Fri, 23 Oct 2026 06:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52108606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iV3h4q13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bbup0xDfsHBOOfWlrbo0j1pUSl8H4qeOPTbrrQ/Kies=;
	b=iV3h4q13TVPNHVJ0rEoS/U/catc3IfH3qpCzkqLr9AQeErQezj381YfakPbGr8/PLx3wK8
	ZgRMFB2gQ8qB7SAOPVftM4qez3lLAarvlxxZ6UDn+HKgPYPwrPodHJlczctVOxEZWURV0R
	FoueApsnC8OFigaP+ANZdKN67UbqX6w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-XjNVYYpnMaOb9zi6w3NL-Q-1; Fri,
 23 Oct 2026 02:49:28 -0400
X-MC-Unique: XjNVYYpnMaOb9zi6w3NL-Q-1
X-Mimecast-MFC-AGG-ID: XjNVYYpnMaOb9zi6w3NL-Q_1792738166
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09D831955D8D;
	Fri, 23 Oct 2026 06:49:26 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24DE519540C2;
	Fri, 23 Oct 2026 06:49:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 02/13] smccc: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:39 +0200
Message-ID: <20261023064908.66707-3-thuth@redhat.com>
In-Reply-To: <20261023064908.66707-1-thuth@redhat.com>
References: <20261023064908.66707-1-thuth@redhat.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 9K91XDSCbdC9eo9cDZQvyPO95bC_scXgYOSFSrHrVFI_1792738166
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/linux/arm-smccc.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 4de81848fe2ee..724bcaf0775ad 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -8,7 +8,7 @@
 #include <linux/args.h>
 #include <linux/init.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <linux/uuid.h>
 #endif
 
@@ -313,7 +313,7 @@
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/linkage.h>
 #include <linux/types.h>
@@ -364,7 +364,7 @@ s32 arm_smccc_get_soc_id_version(void);
  */
 s32 arm_smccc_get_soc_id_revision(void);
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Returns whether a specific hypervisor UUID is advertised for the
@@ -413,7 +413,7 @@ static inline u32 smccc_uuid_to_reg(const uuid_t *uuid, int reg)
 	return val;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /**
  * struct arm_smccc_res - Result from SMC/HVC call
@@ -761,5 +761,5 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
 	})
 #endif /*CONFIG_ARM64*/
 
-#endif /*__ASSEMBLY__*/
+#endif /*__ASSEMBLER__*/
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.56.0

