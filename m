Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738189;
	b=vUS1UqG8LVteDxln6Kfu2W4F6VZrjxDiMeQQioc6r9UcMm49jrk0Z00D1e9EeuJeIWN5
	 LJcFwZC2HPzXNoCd682hn2kxo1F8j6dedxzpN5HYVJYBFqgKJ0CCc8sdNLMjh+3z1ouDn
	 b4OCsJulhmUT7QBb+BTWE+mD6OnLexj1tAxk76Yuvr0+if/JkSEF54Q8WxFcVr7wHD8Lj
	 L150zoaT0U3AiHx2O6d+yQgVHSvpadvmbafDssbeYk9AgyqgPrXw39HxuPhTwexwYB4ca
	 wB9J3btjyWksBc+wmEeEtEz8ejPQ9DkShvUBa45iq8SuueBNCrqXFlA9GAX6kmRNUBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738189;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=pnsGwwPy3Map2dMpDSsf/qA7ETBcYenhQwqHxWWkosM=;
	b=qYz1zGM/2uLrc17sdrFBO924bv8lGoEVmLpnwly0QG1gycQg1nzWqgNdTmUyjgNQvYD+
	 FjkapO1zFB3i5tf3yg4wtiO8RnY9Vu3pCl7eMzevas0CWEmTe9V4nyj9UrsN4MY0dHF2i
	 C0rm6VKBeQf4S7DfHosRon22PSeaEkg8BLJiD2rb/3Ve/F5lbX7D+XQbpc8XdKbEQmE+c
	 uRWUi93apa7gL+NhA3Ze1HzLr9J8ItmqBDZ1pzeJXoymzT9XxrD+dou34SFrHDXLR2CdW
	 25apFXeb2mEEEKdDnHgpLipj+e6Qh1bf0ERd9deRP8VtqguBDE0Z0mwDwvjxzYOe5aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="axY/mh/i";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC6606A339
	for <soc@lists.linux.dev>; Fri, 23 Oct 2026 06:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7FC6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=axY/mh/i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnsGwwPy3Map2dMpDSsf/qA7ETBcYenhQwqHxWWkosM=;
	b=axY/mh/iCI5ehRBct0OE8atWCIh5lKpXdE1KjGbg9TQfcTrxZ5vQqwUZi9f6zR+37rc5mA
	K2iE75YVQ6yTjcSXcJS2QP9DCZOkGlwrh3bOGtXNzbvxxO6HCSoBWBZXASmejNkWut2o3m
	hp7RPhFfGYsa8LubG7DtKiJ5Mg3tr9g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-NOIb37YxPOqDns404ySJug-1; Fri,
 23 Oct 2026 02:49:42 -0400
X-MC-Unique: NOIb37YxPOqDns404ySJug-1
X-Mimecast-MFC-AGG-ID: NOIb37YxPOqDns404ySJug_1792738181
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57D0B195606A;
	Fri, 23 Oct 2026 06:49:41 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 94D311956095;
	Fri, 23 Oct 2026 06:49:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 05/13] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in ptrace uapi header
Date: Fri, 23 Oct 2026 08:48:42 +0200
Message-ID: <20261023064908.66707-6-thuth@redhat.com>
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
X-Mimecast-MFC-PROC-ID: UmrZXyoxpNokDCPnaq1XGhlxYyi5I2coKAD7dXV8ThU_1792738181
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/include/uapi/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 2ef917957005c..15e6bff56b609 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -110,7 +110,7 @@
 #define PT_DATA_ADDR		0x10004
 #define PT_TEXT_END_ADDR	0x10008
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * This struct defines the way the registers are stored on the
@@ -149,6 +149,6 @@ struct pt_regs {
 #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI__ASM_ARM_PTRACE_H */
-- 
2.56.0

