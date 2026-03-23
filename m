Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B13AC0C2
	for <soc@lists.linux.dev>; Mon, 23 Mar 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273129; cv=none; b=o1gKyk4aMpukSX6AOrmgdLeYNHUDNxXMCxXw4pmr1UyHNkcw7eJBVUBc5QQ5yTwrDByGe4xg9rc8YqYGPnGYMtFkgosBB6PmZDo3yG70h9LMocC0iuh8UvrUdgpTG0p6pi6zcc09oZacwKcFr6ajkoXcRsUcW1sDmBSGfZxMQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273129; c=relaxed/simple;
	bh=j2KJsUuvzGGf1CfWEwTwFG42x5CMZoMq+03WHd8ylpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJpbLwM6+BC2miwEOia5jnyAg1w//blGF7llQbbqcF94eF5wcNvVpyCwGyuSjlF79vAv9ih9S8vZHAhLce/6E55+CBlwnsGsrO4SpeURKEHeuw1L8SWWcEM5Ilf+sGxHyd++d/n7sAowQJm0xC31QpflqHXxoa3zA9MZQnAS/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AK7bI/Xu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AK7bI/Xu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82418b0178cso125391b3a.1
        for <soc@lists.linux.dev>; Mon, 23 Mar 2026 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273128; x=1774877928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=;
        b=AK7bI/Xu32JiiJYjIAduMML3ps+o+2Ka+jQHbFKUUjH3gehI/+ZtFfjTn6E1AzUN7K
         zs+36n8sqBxQXAppICypbOezP6dU/HddE/l5alNqpIWg3e4s9XIcdL9AiPMvPUO8PmpB
         0xakIJKCtIOPiQ9EKFZRQIe99tdL3+pp+nxEOl5tIAZW6gaNqNKfGueAFHMDFT50T16R
         hiXJTYHQt98/skOOWtgJ2v3DK6spLg1dpJchgnM6Zfag+7F2zMCQTwqUjebT4fflCx7m
         CYT1n4h/9hKj45KP235JH6gNlY8TDs2QIv+C4z4VKiAoVx0caYElAB4LR7FjcKP2ekP/
         MH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273128; x=1774877928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=;
        b=OsnEyKdPH79Kzaw1PO6LLLNmkjhh1WQpU9Ojwb3CNTuhSDtKbgviyb62e2q4MSwvn8
         e/5xkgKIVwAthYg96M9s8K7TGnhp/tZQj8+F1/Mwdv6o+V+V/xcIYyWOp76QOzxok75/
         TRhCdb+q41SYwzA4SdbiEVc2gad2AhJvbAflk6fTnA+f/dPSZv+yr1lBZMJ2w5nrJm65
         e4HPw6sUXrlCE9Ecbh64P+6bGfKuY3mmh84CmVEk0AgCsEhvKAmDnV33BORIHFNAUtij
         dZKNQXhQliD200gW1KZer8Xwx+XLPxnmcjBnTE5D6yfbbF2KPwMJyt6yWhWFWBkZlobc
         +diQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/UO4mbpUTBqVeFrwG0euoS160X88+Guai4q0cEUGwUpTwuBSdkph+/mDbNMB5wOji6rU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYTX0u62bjHZydAtECx9ezu833bVXqi4IP3FGoRa5sQzwZEbqr
	qdkEIaZrBX8G5TEYitC5RTXOxr11q8LG5iQP9kDKjzdCy1Ws5+y0JDtf
X-Gm-Gg: ATEYQzzBk8SKv+K3nLLqBTekVH8svPEgLZBfsYGLkDIk3u/0yjOPqo9Yb6cPK+PSC4g
	/y8KSZ1Zm22fl9HgNRDHl4FaAJsAf7f9P4dDazvRNlbhQzRUdG44PgfaT4/oqhmvK9D98tJ8rMy
	xMg91Sgqn+Jd3KyLrLJiVMB+Z+6SRnYfJatxa2wbqHmdl7qDpNPeFD01mckvZwmG7QEhQOI9fqk
	p9i+a2Jk1uBMHLZKOzc4Qklhf5nRdpj0izcMDWyWVJjEOK1XPxuTT3DQ8KfSNePOIy1gSHQIKcF
	DdYKFu6FpaQpRNfuyMEWRcGXwsRtYsoJ5fKbU+nO6Nhfi7kohAZixRxmUAATPaaD6RefTYxy3VO
	548M7n0tYjOeBggwDsaZ6OrbZisQP8D8h1Sg+A51fEdnXvbJbl5nvU0drDKZdtwMltoUQCg14Vo
	tJoQO6P1m3nhpKJFP8ZhhoM7ZhkSIsN+OKCOnvKxT9xmgnzUb5fHXybybQzfAq+ESZf7iGLgLma
	VU=
X-Received: by 2002:a05:6a00:14c1:b0:824:9ffc:256c with SMTP id d2e1a72fcca58-82a8c392254mr10063609b3a.43.1774273128123;
        Mon, 23 Mar 2026 06:38:48 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:47 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear thermal sensor
Date: Mon, 23 Mar 2026 19:08:09 +0530
Message-ID: <20260323133814.14152-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running DTBS checks on st/spear1340-evb.dtb results in the following
warning:

thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
  from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml

Rename thermal_flags to st,thermal-flags to fix the warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..97357680dd51 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,7 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
+				st,thermal-flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0

