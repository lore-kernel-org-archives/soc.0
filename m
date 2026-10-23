Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738192;
	b=YV6tlolEgz0sCH11tv/kUdrL8E2FBygt1hcoRpUsao+4h2KsuqeefqB+E0Sn6Ig2BA40
	 vZIRFwYcbcTJdL+JT2NATna+KaTGqpf/Pz9abubhXd1pBTwJ5LYBgoPMwXwZO5JO5pe7n
	 cMGA5+baFiu/QdF2Y1VPNhS/0KZ2/ViJLAMVq+LFTEaMq9ppEWV5NImdTmQKB72cOUZ1Y
	 hZnryivi6o1JOeUYO579Igw9d4raAmEX+sOs6YleWHBWsq0avvaNC1LnFeoMwUmvUlRba
	 T1GiIz7RJ8yBIz70lyDs5XtoRQoCZ2mvKr9k9SfLMKFnxiFj4ZlN6MAoIphRnDZxQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738192;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=5KBAP8s/gvZ5T5E5z3STKabsBKCenIox3Dw1zgP8Y70=;
	b=4Q3iW4+WCE/S3b1Z8STWnX9GM27GC1PI1uo8GwObJRS13Yy2RKm1fQinrSKITbA/b5H9
	 RCiMc97aEt7PwmqnAp60+MHdWqFnUFf0k2kTBCp3MYkDpsgUH53MdlR/IJmg3qqfxC+B9
	 YDUIqo6sW4yWnpwmNNd6RaxEhmLzFqnn8vKZWRSnqrD9NFn403t3YoJhwy6ipMZUrt/yl
	 u+xeNqoNJM3Rd3csdNUtNEkQJqlD1JTy5NH1TFI4VXEUNFe+Dh2BOWr2vIrbub6imM9l9
	 bIKmlIM6XDLViFpZBKz6iRvY+gqSWrItL+TLAyZpYgHEi2zH3vLi+tG8mPQI0kcFa0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F75HVKUM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAB360A2606
	for <soc@lists.linux.dev>; Fri, 23 Oct 2026 06:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CAB360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F75HVKUM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792738190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5KBAP8s/gvZ5T5E5z3STKabsBKCenIox3Dw1zgP8Y70=;
	b=F75HVKUMWj00XPKu1pSnzQn6zOIbLWcQho0yw1XuR36Lh5otFoOX3f7CGAvya54NPITgw5
	ab50PdStH2p8sgfYoclcADBUubjC2WNdQv5qb2keA/mZPJC2XfTyxGUBAw/zlrvUKydAvJ
	aHUZ1+n/ENxVLNNVgmlQU1RVt4UE+So=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-SuGaaj_gP5aM0W7KkKCVMg-1; Fri,
 23 Oct 2026 02:49:40 -0400
X-MC-Unique: SuGaaj_gP5aM0W7KkKCVMg-1
X-Mimecast-MFC-AGG-ID: SuGaaj_gP5aM0W7KkKCVMg_1792738178
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CEFC818005BA;
	Fri, 23 Oct 2026 06:49:37 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2707819540C2;
	Fri, 23 Oct 2026 06:49:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>
Cc: soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 04/13] ARM: BCM7XXX: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 23 Oct 2026 08:48:41 +0200
Message-ID: <20261023064908.66707-5-thuth@redhat.com>
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
X-Mimecast-MFC-PROC-ID: nDMINoDA0UZ-QfiBDvCMdzieYG4n5dH6DDuhMmYSiYc_1792738178
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

While the GCC and Clang compilers already define __ASSEMBLER__ auto-
matically when compiling assembly code, __ASSEMBLY__ is a macro that
only gets defined by the Makefiles in the kernel. This can be very
confusing when switching between userspace and kernelspace coding, or
when dealing with uapi headers that rather should use __ASSEMBLER__
instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
this confusion.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/include/asm/hardware/cache-b15-rac.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/hardware/cache-b15-rac.h b/arch/arm/include/asm/hardware/cache-b15-rac.h
index 3d43ec06fd359..b96365bfb2a87 100644
--- a/arch/arm/include/asm/hardware/cache-b15-rac.h
+++ b/arch/arm/include/asm/hardware/cache-b15-rac.h
@@ -1,7 +1,7 @@
 #ifndef __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 #define __ASM_ARM_HARDWARE_CACHE_B15_RAC_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 void b15_flush_kern_cache_all(void);
 
-- 
2.56.0

