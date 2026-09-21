Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E6448BAB
	for <soc@lists.linux.dev>; Mon, 21 Sep 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790023346; cv=none; b=RJhw/NOtL8VHtkl03RKS6Z9AleomNtouCAWTQW/TQwoFukWRN4pW4gB85YJjNtPYCJSX1IZLCffpaCEgmhrQPk59OnE7RGrqaVVBhVc+CP3/IJlXmtiWKsQoqhkR1aKyZs8y/qn0Z50AtSkAokwoVAaoVE3JA8n6grc2rCxNRBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790023346; c=relaxed/simple;
	bh=Cbhq5AY4F38rOC/Kyo867bYsHX9pFIIo/xsqTNuiRaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pzr6cupH7SPB24gi6ElfWVGxrr0sVJw+Hj5ZIatuYJXXi6hODPv9gckyfgsU8/XrTg9bKoN3TXOK0S0Hy9k7hRzsGXuFqIeJXh3Qr3pXitGEcr3TZJJY3pDhlvM73mUbNqKP3A1zLnAEtabBVwusFRR3sNbBDh6VW7vWHUq9nH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nY0kDJHH; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nY0kDJHH"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso2331074a12.1
        for <soc@lists.linux.dev>; Mon, 21 Sep 2026 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790023344; x=1790628144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=nY0kDJHHmvJYWotJ5P2i7lbRMVlyQiM+ZJDhEQH03pOeOkXT+NIsdbc991vqbHiu9G
         qy2G8E8dZ5UkgukRBh7aNXuUVXR8iU/wIZb/kCAt0ChKSRKPcobmHLD1XN4OVxVoptkN
         0OrQIwsWQXtwAL4o69uR4WzUdZIG8z2X2lcJ0jYn2kvLmPlevjy56eTYXesakCOR1sL2
         a1+t+MDqySDDTVIkAicdOqqCyDwfg3LHfpY34T3Oc9Zb1SpajXG+8eEemPi8bY3wa5hm
         QyHJvRg1w3setcD8zwpVinpJqM64ObyHkOFJlsh6Pa8Ul24A1DXoQDfxzQpW1euXbxp/
         2PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790023344; x=1790628144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19ujXM0/uR0vXBiub8+6aoHd0jV8R/3wu1J8/sZV+qw=;
        b=U3lEwwYuPXip81Jd8LQsPvZZGoIeLLBhZTWwlxIGjSuHckN1ZldwYu9yM0ySSnWl4u
         yWuTwtjMSxcKsV8rCXILf2t0cLAIRZyKKLWg41hX8EbSVlciNrQTUoqGjvhImPCJA6W6
         brrWvh5FiCiSUGTS9tPmWhIzcS8Kx0qYl8NwJ+FvHkDPmZQI5OKqH8jeY7brD+iWX80Z
         n5QGkN6IlwEVgu5GmiD76b4F1Jn3AyTmsb9/RPViii615ZCYzIN7hYkmQPEUCM2IvXqk
         cXIG5z0p1jK1z/4OnfyXq1sJb0jjQCb/ahJmGbJbiWON9uK8UkiNOBRbNWXLQF2j7I4s
         wpLg==
X-Gm-Message-State: AFuF++ni9zNB982FmPvYrvq8FH/fQnypWGXnpFjT59vjOrkxtLxdCrJs
	o3whaiGk7i0r1RC6GezKj6fBYqLua+3OKMb/r8NX/1+KR+3/010euiqm
X-Gm-Gg: AYBFou11DoSAlE3s/k1IJg7JDH4wMCVHD5NFI6+LUGbzuzmJN7Pcd38O2vA+gdQUOeh
	mZe0Z0CKGSKRMe8In4Nc5T5jrbhO20Hso95wrRzw6OVnc/1lWihkUvHoahgA2wJxmFBZIPu3y4Q
	B/9kqgp2xos24EPHEoHQciIn4TbjdEuLSyDBdOUa1eirHMPSFv8tjTD8hAVHJf6zyixh1GpRwO3
	mq0KsA/Wpnn3BHKUXBQNzftFlGmXLAeUCoxddq3IUXObngvUB7ViS6xiW34plijKYyNP/ckd6xa
	nCWS5fYzdzp5GlYk+ZKYMN587oUznTSRYyxpf7wLEzZLMXwBFz2kNJlK6Mi6Dh4THFM1MiYPJb2
	7NrCzYwyZV6SsLiZqKcIhIL5i/K0hlEID1sXXrzHit7QFUaXL4HfJiH+u1l7VoydmHiddyLSan3
	x4ZXx+YaXZl+C6rIfsaCpYcoILyABunDg7a1OYGn0vxMRg/kj1Sh7izslc650vKOmYxoqbrTXQT
	/hOvsHDmcCfhzotm5G1
X-Received: by 2002:a17:90b:4c02:b0:39e:2036:8243 with SMTP id 98e67ed59e1d1-39e54eb71f7mr17140919a91.25.1790023343451;
        Mon, 21 Sep 2026 13:42:23 -0700 (PDT)
Received: from cfarm424.jing.rocks (cfarm424.jing.rocks. [2600:3c18:e002:2e11::c424])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm967996a91.2.2026.09.21.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:42:22 -0700 (PDT)
From: Ridham Khurana <khurana.ridham222@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ridham Khurana <khurana.ridham222@gmail.com>
Subject: [PATCH RESEND] platform: cznic: turris-omnia-mcu: Add missing MODULE_DEVICE_TABLE()
Date: Mon, 21 Sep 2026 20:41:47 +0000
Message-ID: <20260921204204.797294-1-khurana.ridham222@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver wires of_omnia_mcu_match into the i2c_driver's
.of_match_table but never exports it with MODULE_DEVICE_TABLE(), so no
module alias is generated and the module is not autoloaded when the MCU
is probed from the device tree.

Found by code inspection. Not tested on the hardware itself; with the
module built, the alias lookup

  $ modprobe -R 'of:Nsystem-controllerT(null)Ccznic,turris-omnia-mcu'

reports no match before this change and resolves to turris_omnia_mcu
after it.

Fixes: 992f1a3d4e88 ("platform: cznic: Add preliminary support for Turris Omnia MCU")
Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
---
Resend of the original posting, unchanged, widening Cc to the SoC tree
(drivers/platform/cznic goes upstream through it). No response to the
original posting or to the ping on Sep 9.

Build-tested on linux-next (next-20260921).

Link: https://lore.kernel.org/all/20260827113241.993923-1-khurana.ridham222@gmail.com/

 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index e8fc0d7b3343..f0416302a1f3 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -403,6 +403,7 @@ static const struct of_device_id of_omnia_mcu_match[] = {
 	{ .compatible = "cznic,turris-omnia-mcu" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, of_omnia_mcu_match);
 
 static struct i2c_driver omnia_mcu_driver = {
 	.probe		= omnia_mcu_probe,
-- 
2.47.3

