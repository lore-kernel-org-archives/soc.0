Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ED2375F65
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 16:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181347; cv=none; b=R48VKtl7jeOcgHA3nBmKUxu80n/QFU+fVNZFmdEFSvExwuXhSurcZPA7X6kJQlweZRubzT9Y37OKeyuziriWMZ7Q9zRrgqYuQ/XVV76IgHprnRIIEBwRFtMEceYLj5nq/AL7BnVVySISGjr6DqF/AagHDm66qS5Prvd0BTjk8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181347; c=relaxed/simple;
	bh=u5gxEPDdMGngagwxyI1X/73gU3KsM7oagGaXMiOMRnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Be4y5gEQqRNAMe9s6HGOHY97rwRT7wi2h5qTA9aAwVl1LU1Fyphpak/TXfe9NT8fLMPTp1HVp+Umcz73fV8BGba9mRm/W13MV+chAy09XbYgCF3EGNGTybdBLGHK99tOTftS3nV1ERgRxGLg9VOpDwDOf5UqxjW8y5d0fAuLeeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJSWH5dA; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJSWH5dA"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb769ca17so9083211cf.2
        for <soc@lists.linux.dev>; Wed, 23 Sep 2026 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181339; x=1790786139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=;
        b=QJSWH5dAxZymRdp4MxDES9Ga8or7DtC3ePZpqGF25UTBMsUoPZMmp4AIrcyBUm0SP4
         mcHlwsL7GwdNNBZhpQuEiV9k3pIf+Wg6fe9Xt/2X702X+I/1DxvvKNMcSi+CeWjM2M+7
         EWCBfhYC5/ruWQqjWiLV7ua0vcmxv4MBDL3XUfeIhvp9YTwCVt0HN2GSkQiAZOoY0jUX
         2/0D7tnXqkLKq6kTG3uX5GJRmlvQnfeXwC3zyM9M2s8a9jqimkFvNvRYreStie5av0Sj
         UExxgr2hK591SfOa/w43Y55mdTkQ3r2CpROkLKhigHELjjmTL4F1+wvyazwq24hNmooT
         4gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181339; x=1790786139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=;
        b=iDu1MXFsZpSDdZuOR7DLyN+QJFUipnCzEVxVI5CHjes74hSTX6McnmrvaGMAjVYsjZ
         PLY6ZEdaJ04/hf8DT5BKqX8N9C0pccw3HV4eAMGNvUIrVG7gYOMpvS4vk8dxcmnkVy6H
         WjqFIumW4XEh3I18CxJXHSAPMxyGvzWHU2jvZ56lojaBG5plh+c5tIpwm1vxVtkVH2Uh
         tJZJ6zLQvnbD//O1m3paowwcnLcWrkvEUObLi/uO5WhMa2p0RY2pDDelLa1wjHhu2rfY
         Nf7NSrp/n5NKdYkIpRl0I20/wy0lgFMGxbSICtOagQRr2L95X5DVUUn6UT/l+pDX9pcQ
         dr+w==
X-Forwarded-Encrypted: i=1; AKwUvBxlw8kVKlWD1txkhnLXYfxKBZrQ2ZJ1E9xvW4tPXDJepmy4FpPh/DO9tvrLE/HlR7NHcJA=@lists.linux.dev
X-Gm-Message-State: AFuF++k26u1yuULAMW/nLl4MVCEAaJkcp+uElQFtPdKBtf5VWUvuiJPO
	HeX/ATP9qWZKfLVW6Kf3NDQ8Eyag7kzXwOggm9edVFU01lyfk3gIuc8w
X-Gm-Gg: AYBFou3bXbY+JlqnLIetwpnaTQoY0jq4Kp1gY6lUaSU8yrhGWmG4vhTExovIt2HPGdo
	90qyi+UHiPQkgrxj5dXhyP+PwCBU78K3NOuDgrYh2hEZDgKsYNvaqNXHUasrQooLlTrtXxlvvvL
	lhXrb6v98dmvmSdFfnBlrfQQrwqoBGC0Dt05yxLKAq3YgJg37nVc60luCB9uYDShoN1XETRQdJa
	JzcEdAN2UminV9he5fv6CA1FMZLV5aGJBRKK2C3ze3BVVsu0lzqvuBN1/cM6XxjRvyN+mubEG1V
	qB2HbFn5FctvsOB44haQyi3OOArWkZIk7/RfpUOyhByIbCCEd1YSUKFYP9+rWLV8nQSz2MiqxA/
	KK9qT3Asoi0ZgpnwgFZllaC8UlOriTvQWsw9hnGwz1kg1dhVwV++R2SbZqAaG94twGlrhDf88aa
	32dRH2pvQ3kXTuiRxbVrOTRTuwG44PxMkYIRs497GsrmDU/vvnpHBDg6qg+MzgxmtkJBoepKUKu
	pg8gvyix1T++hagMyxHsg==
X-Received: by 2002:a05:622a:1cc9:b0:52d:28f8:578c with SMTP id d75a77b69052e-532eada4922mr49461241cf.31.1790181339344;
        Wed, 23 Sep 2026 09:35:39 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb210527sm23066351cf.12.2026.09.23.09.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:35:39 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: arm-cci: Drop CPU node reference in cci_ace_init_ports()
Date: Wed, 23 Sep 2026 12:35:15 -0400
Message-ID: <20260923163536.596107-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cci_ace_init_ports() looks up each possible CPU's node with
of_get_cpu_node(), which returns the node with its reference count
raised, but never releases it: neither when the CPU has no ACE port nor
after the port has been recorded.  Before the commit below the loop used
for_each_child_of_node(), which manages the references itself.

The node is only needed for the port lookup, so drop the reference right
after __cci_ace_get_port().

Fixes: 78b4d6e0fd26 ("drivers/bus: arm-cci: avoid parsing DT for cpu device nodes")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only (multi_v7_defconfig, W=1).

 drivers/bus/arm-cci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571286..076ac8e06bd01 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -199,6 +199,7 @@ static void cci_ace_init_ports(void)
 			continue;
 
 		port = __cci_ace_get_port(cpun, ACE_PORT);
+		of_node_put(cpun);
 		if (port < 0)
 			continue;
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

