Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428960;
	b=ELt1ODrwUIhg9zSlJ4KJH5KthVBpHBCXjjRitLVWME74v7StFTFv6xKhnAGUxEyU2tXS
	 gQts2CcUi/VJFDEkSptmwTD21XJ1bMeJvr9Gz7wwrcW96iD8QuQDu0NbZzELhRN2SRqxo
	 +Ynz2CaCGZAMMjEtyAWze0jm1ZSv1oTR+c2BuOeLPFovYylOXqgPIABqoigT9rHIH118D
	 cuDxCEVqxNaSO7J5bN+euNJcLMQJPeNnkbiRlszGfHEFoDbZTS3OAROCAONnOC+KGhdoF
	 q01gKV/e3m8t/HJ3kZ8sO3Bm+m3RKjVUJSipX45cqGyt1bxZ9E+wGO14+SI/7vAYS4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
	b=rERXhSOUjuyYKjHNYcp4d8p5VdFaXG76Jdje/ytf9ZfHO1ulnMaHNCN28Mmbk1Luxaq/
	 D5NsDlOuDQqJvDdFanfTy6H8IO3G9Z4fJp2U3oC8QReuV4Fli8fejsmZgtbWv5oQKmaVE
	 vMnXgTO8LaAAIkFMtZ1qbUZ4KzjXpu/zufrCQIxjQr7+Ep1HbPwGr1/ik4Od4ELXeI52y
	 NgS2741OckBBlkwb5sQpKJ71ZhjIPcAWHjru29kSZztrRNAz2JlADeHy6VRh05Q5Wzf0u
	 3g0F553jutFM9lBdADCVfGuoWZ9SBbr9hVrh9h4SsaqytrmbHSadVRi7WxZpRxk8Cbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iY90RA5q;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F677606A32E
	for <soc@lists.linux.dev>; Wed, 11 Nov 2026 20:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F677606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iY90RA5q
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso4523583eec.1
        for <soc@lists.linux.dev>; Wed, 11 Nov 2026 12:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428958; x=1795033758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
        b=iY90RA5qJk5A8WFq3mxe3dfc4p8XV+TlLSpH+mqbmVmjPtZ/5RgC4l+2+rnc//ErgO
         bkRFnB3ibMvkuliwq2NNPXOyV+HxSS0LH41jjiIc9RIFCJR0B9TIHsmXx9uP42InvL1T
         2T5UwM4eR1B0B4OHRLBxXlylmkCKayB/mhpLGKlYVzWE7g1n1y3dt6MK4cfX0JWMXnPD
         4xkSg8WLHjLuOt07wStXESBMzi8tJ6ZzevvklkV+idL3pofxPuPP2grHbuutVlEFTCTL
         REeFR7EsIDoNlI+7S37MAsauaXGXSHCyexPtbGNDnzwKBRnlW3TORZoG8Y5tDE660pCW
         zVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428958; x=1795033758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
        b=ULu84x3i480bNvHmL29JD7QaR0QBdiKMEaxAsn+XWjmigmvhT9tn0xr+hI/+cCrftL
         auD1jZMPgQhcSfakPG2I9aPvx9QgleM2v0DkDoAzreD0oUXGIj9qP4cv9HPNZXRKpgkB
         wLnfPSpDanHYpTeLYPGpsD+4GkQTX4x/UFReiDMmzE/jIpLKetr6OIskY5eLwTepDWm6
         TnxDnG1rWp3T0WgjPUXKQeNRJIERNHBjzQCTGXz8Ogk9StzUC6VAt82lYrH+O2aNyF4q
         7Gn5BlVZsPkaBWN4Fko0AZTejHIXf6rng5j+Hcrrlk2liLOKCfu4flFtHb7nswA/h5Qf
         iZqg==
X-Gm-Message-State: APuU4Z8XaJWTFugbvr7E3p/I81XK2+04k2FSFeffGW4JOrT91jMnA9Cf
	mIbJ/1is0X04AfTi3ABErLFt/9PgFXvGTyzFrnb/jhUXd4se1rRCcfHxeSOCSyKb
X-Gm-Gg: AYBFou3w3DM7W0ZzENu+7hAtha29IMY0TWIi7/LFXmXnlCLo/3qbzHRWs0eikM/m8Rf
	7KpiNCujP7eN2lx/F6/C0Z5xqXGGUT/yHVvL0RXx5/gl0+/jJMGUOhWzMKNcLVyLvKps8GSFOxV
	jbqWQ0i8eHhQzgh1Uf7hiUjN84GOLPICmUKhrt/oDSRhsG5CtNakPUpzk7ZHoQgUi9FmtSFy76R
	h1I+RmM8PD5JoE5M689nIHA7rqcpz0um95JzaWsh8srS2mWvRhRITHhSsVK2tDNMd/IvDLkQup/
	iervjCovnbALeH0AQ/JKYEJxDxFcN5YtDowO6XMHfkMPXHAyr/oPet9pGs4WkL+go8L9NrdD7GV
	FngSbArwJOA+wgpjbuCkOa1iovqPtQh6Ka7Y8zZeMkCyBqLCeA5IFN6bznozOY7Zrz5Yh4lWjB+
	QwvqEKuRXgzDBC50FmQ1AT57L6ntPfNaX+Vw9Cs6iiV7D5DD0juXo4p1nTAOhaRQHVgvc0BgqHX
	JwcaiSrOmmvCPdBKn4ZNMqXtYUAgItrmZhKCD1WJtnNLj6+LB02w/IGZpvQVdDehfBNYrvvF/46
	OBNTDS5T4YnsOYp5Awq3BsFtJY6rXkxZ33G/KgS3Bg==
X-Received: by 2002:a05:693c:42d3:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3768694ff22mr3227743eec.32.1794428957949;
        Wed, 11 Nov 2026 12:29:17 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm20740200eec.17.2026.11.11.12.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:29:17 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] arm64: defconfig: drop four symbols that no longer exist
Date: Wed, 11 Nov 2026 20:29:14 +0000
Message-ID: <20261111202914.2558187-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

None of these symbols exists any more, so the lines look like options that
can still be chosen:

  NFS_V4_1                  folded into NFS_V4 (7537db24806f, 2025-12-04)
  SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62, 2025-09-12)
  NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4, 2026-04-22)
  SCHED_DEBUG               option removed     (b52173065e0a, 2025-03-17)

Three of the lines went stale when their symbol disappeared.  The Ethernet
line was added by commit 32379ad4060b ("arm64: defconfig: Drop unused
Ethernet vendors") on 2026-04-29, a week after the packetengines vendor
directory had been removed, so it was stale from the start.

Scanning every Kconfig definition in the tree leaves no other stale line
in this file.  Similar leftovers remain in other architectures'
defconfigs; those are not touched here.

Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December 2025,
and Vincent Mailhol's "configs: cleanup obsolete or incorrect assignments"
series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in March 2026; both
submissions are still unmerged.  This patch covers all four lines and
would supersede those hunks; I am happy to drop the corresponding hunk if
either author would rather keep their own.

Tested as configuration text only: "make ARCH=arm64 defconfig" on v7.4-rc2
with and without this change gives a byte-identical .config, and "make
savedefconfig" emits none of the four lines.  No kernel was built or
booted from this change.

The change and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and the reasoning, and I am
responsible for the submission.

Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..513f8d6be073 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -424,7 +424,6 @@ CONFIG_MLX5_CORE_EN=y
 # CONFIG_NET_VENDOR_NETRONOME is not set
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
@@ -1756,7 +1755,6 @@ CONFIG_QCOMTEE=m
 CONFIG_MUX_GPIO=m
 CONFIG_MUX_MMIO=y
 CONFIG_SLIMBUS=m
-CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_IMX=y
@@ -1824,7 +1822,6 @@ CONFIG_SQUASHFS=y
 CONFIG_PSTORE_RAM=m
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=m
@@ -1861,7 +1858,6 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_CORESIGHT=m

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

