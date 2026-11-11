Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434843;
	b=b2lah1m1B+daJIUHHXiKEc+l3VEl4nj7iaSAwhEDBnhZnBHdnTzRH4Y3UCRuQ0zM5stc
	 Q/EEVrJMM/PuZfTLtK74oEL7vNDW3+H/rUof95acLY6UPseYSRjoPfNSFbpae/fEpOMoq
	 QdIOAqFNfLxJuVNSIwNcGYG6OVjPuV+wsAdqfSa5lR07C4uwwsv+FmD0b8EtI2hecx4iM
	 lL7wGFzNAAr+r0aSDXd/ewOir0482bSZZSkKcOlNmG4ZlpxJA3gDed1GwPC5oruCFc0ki
	 xq0PbD5HlXAlU7tztZq/79AAeDBFx3rob1jDP1FcaYdk3ZRlvpOF4ZB51qSFe6HhaiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
	b=lngE86R+S0TOFt+3uphRxALh3kar8zRIbINW7Nt3S1DAKhwz96LWcZmEzgke3DMk2l+4
	 3lGdkOmkdkK1TS61x2PFKNHKqTWdRBEdCW3z6w18ycXzN0eBeke83BexVTPskEjd0P2Dy
	 uJZ2y8cbfxjC3EtnFwS6sobpdAHBS9TWPagUudDhbtPorHn5anK3+aUmsh8H7eRnvj7/d
	 9EdD/lqsXYe1wKQhl/dK/XK6uqfo0ImThuXISXkZVXiWfkDYm5YbMQLg62e0a+JnIbgx4
	 GnibrY+O6S3067H1pqIslvEBGtKKqlKqaXtkUtjuhoQXDeFahqsJFCJ9bVYQ+YJBWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQFf7gcT;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA1606A324
	for <soc@lists.linux.dev>; Wed, 11 Nov 2026 22:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FA1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQFf7gcT
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so1352297c88.1
        for <soc@lists.linux.dev>; Wed, 11 Nov 2026 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434841; x=1795039641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
        b=rQFf7gcTuxEa2xlAbFwWosKvQyJpBWuhVwjvOkmGWSXdzrzoxfPWA1Ei3vf6yY+bV2
         MausXiEtCjbKn2Er2XxQq9cEg1ryO37XXP+1k0/Kgja5c3UxmGvStHXgySc2HmsoxrT9
         qXxT9ADhscqeJjpozmKhpH9k1/4XyAKLCh+GJK4FfEWtzgzT2Gfb2kgmeLP5y5EGJqlN
         4G4hBii7RuAnM1nU0iIkdJ+pZ3/A+bDsJyr/hJYoVyu93V7EP+E0XNEwswiftG8rLiUh
         SxSY1rKImq5aRzLRHiYqi4uc2iMKzkED7JBRpj5LwXNzmA3o6GFAqr2UTiTWFzbc106P
         /u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434841; x=1795039641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dsS8/OU0wby4BZ79znZbA9Ny2A1+vlGylVbT5sKa+g=;
        b=PtHolmIavxgS02XSg7IDeFZ29R408QU6ss9VS0KR30LhVZMzGF2/ZzKbmL/g9DZXpN
         oDyAxiue7qtLhC4QR9KQUG8B/Z3UdTyALLa9NBRpionItRJmBW5VRumEwQALhp37B5A+
         AHQbhoXGyNXIPQBHBPC1Fu+Z5zoczNb8X29cYFWBk+t/8W5/RUC68zD5xMg4yL11FkUM
         2Fbrbbt6PM92GZau79NPPqthfd+DtGcKB6/jBCsHGR2qb+etiXmJcrcEIUdJXzWyn4W7
         ElpGEa++pdHpZDuDF9S+hMUh/FFBpj/cJO+wuqmRzsvDrapYgjMU4U3K9xAzooDJyqF9
         M6JQ==
X-Gm-Message-State: APuU4Z+ypsit63LCuUzwNJI5d+sxKOV1DGH1w+5qRNDHWXpqbJQWEcqN
	m/Og2DJaXpVya5WpoxI7V2BqPvK2NYrejEJ2B+epjGJCaOc3UI6W1yay3uWBrH7f
X-Gm-Gg: AYBFou1rrovv7YRIaNDztQzX21krt1eM+SIb2Gc4ZnEZ1z5jJBFAaOFRQGMq1/o8USj
	owRaRUuD98q1Q/Bm8wOHtKT15oWIgGAVEnqwgEOux3LVjbI4J6sKuhRWbqwk83vqmibxyCzhJUN
	dUbbuSjU8yMIL6sT3VFe0+sCYZ3HZdbUVQw4EeyQH4BJhB9K04OXzRhccSY0BBKzPBUz5iOVOzj
	rnLRWP4YutGIjCOQCn7l4ZUzlIVi8A/t2V0qONsB41qsHPk/SnOBaEwGJoT4mZ2y0W+R53mGyFb
	TNT2bo4KPFP1S2gaSTUu779jdiWpEgMwHaK8CYrujUIxRuBxjH9ZpkOSL1oz8LFE0TCL5Hijddu
	jxmcWckW9pTPZat3LIVqGROKneVxGo+U+ELrQVxCGNx3cCql8kIAZRRtr0iwYxXjAru+r6gE44g
	TjxGsV+GCcA+2Aj+mgqy0XxNk2VewsXHSGTzVbObCxxeOivz9N0w9y9ExzoS74FmOfuaQOipF+u
	hBJOTzqRzO/iPSKOBbgFjpO3qHJ7TygSfBiuPWtxeL+94A+92oBZhjuejeM/8jbeYimBNoLB18D
	imlLyDrSlEfNjMSNxCUZ
X-Received: by 2002:a05:7022:296:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b3c0365599mr3096674c88.45.1794434841284;
        Wed, 11 Nov 2026 14:07:21 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm20571438c88.3.2026.11.11.14.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:07:20 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2] arm64: defconfig: drop four symbols that no longer exist
Date: Wed, 11 Nov 2026 22:07:18 +0000
Message-ID: <20261111220718.2586239-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111202914.2558187-1-takano32@gmail.com>
References: <20261111202914.2558187-1-takano32@gmail.com>
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

None of these symbols exists any more; the lines are left over from the
removal of the options they name:

  NFS_V4_1                  folded into NFS_V4 (7537db24806f)
  SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62)
  NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4)
  SCHED_DEBUG               option removed     (b52173065e0a)

The Ethernet line was added by commit 32379ad4060b ("arm64: defconfig:
Drop unused Ethernet vendors") a week after the packetengines vendor
directory had been removed, so it was stale from the start.

The built configuration does not change.

Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the commit message now carries only the change itself.  The test
    record, the earlier submissions and the AI disclosure moved below
    this line, as Krzysztof asked.

Tested as configuration text only: "make ARCH=arm64 defconfig" on
v7.4-rc2 with and without this change gives a byte-identical .config,
and "make savedefconfig" emits none of the four lines.  No kernel was
built or booted from this change.

Scanning every Kconfig definition in the tree leaves no other stale
line in this file; similar leftovers remain in other architectures'
defconfigs and are left for separate patches.

Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December
2025, and Vincent Mailhol's "configs: cleanup obsolete or incorrect
assignments" series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in
March 2026; both are still unmerged.  I am happy to drop the
corresponding hunk if either author would rather keep their own.

The change and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the
tree and the git history.  I reviewed the diff and the reasoning, and
I am responsible for the submission.

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

