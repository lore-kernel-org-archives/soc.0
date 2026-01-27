Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C125D1E9
	for <soc@lists.linux.dev>; Tue, 27 Jan 2026 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498182; cv=none; b=Z5r6ruh7qMHFqMR5SFcJHnDcoa7OXWZWPuUrHwDBag7tbhVZCHkazpcPVRzsRofFYAHHDtSVLRO/jDY467kKrGPiykUDVc+9CnV7O8De2PrYPI5rzOqrtLyIoua6Yp+HtDPxLTxson3bLow1I0mH8CIZtQjvkC7+TvloRCXIOyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498182; c=relaxed/simple;
	bh=Bt2f8O71ILMUJlYCIa3igd0y5irBYca7QPYlmNcvzT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAWdmOt8UxlCksEylwyIpPg9qgr5UDo4lDbQ7v5isiHk5500ZH6aIK+S4Bd/nU4SQ6HRwEkc1H0glhBbHmO4VTtACpIYu4xUkmGM9WYQ/YsVJJ5/NuzY2QqVJ0FLhOtkWkxBAu7xjY2AP6SnfNofabuOjkr4lv19Ln9VSEvscgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6ob2Ak5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6ob2Ak5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a102494058so30162055ad.0
        for <soc@lists.linux.dev>; Mon, 26 Jan 2026 23:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498178; x=1770102978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGC1e7GTJ+gs5YLdBWssdAfqY7NGH0UJX4m8BTmPg/I=;
        b=Z6ob2Ak5RNP3b4igdBbzsg/iYkn8hUxhpZkt1vhTgqP5MjN/07O+fsm+s5u7vumoKO
         H9cm+uhaUUr0oml0qvUnKIP60f7w2M/fxcK71j164TibgPkjXxQJt8u26DNTE8yqH14v
         ag6PgLp/PV9DT+uv+wZs30ewkiATfwyI7wZ3VntrksERJcrJrT73v5qwbShpGjrVKW+Z
         4M8C0otjlEgI7eO7ej2PuMVDC2wB1I0vWMjOZMf0AJPZoH+QMdqG5aE312eqvA8dLLZT
         s8RYcJEhX8NqNIcLyjaIUduStIrN0pxVszhdewwbpW0nAhX+3snBaJ8wb8gJOy4FAqrb
         ukDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498178; x=1770102978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EGC1e7GTJ+gs5YLdBWssdAfqY7NGH0UJX4m8BTmPg/I=;
        b=WkJCJ5/kg7r0pBN/EyPqFTPVwfNeQrrUzDB8gcpHGqUC4n1gnOBXXNiyHhsu7CTqhe
         PbkJnd/FG66MW/Fk8ECeWp68VFH6aEShmKnGCo9yumyimElrtYlPVhMupLN3tSrDusmX
         AJm9DggRA4Mpx1Ocmo5Z9BMdORCYJCzoX7gxMKyr1OYByCrZ8cdXyEzCazdGFJalFalF
         wO3s/ZIpKj/7zhal/55ZV2z6og9c6qsQq4uGZZ0xnKnMkuJ5AvMXW7PdqxUJ/Q6S5MHN
         w+ynN+6KBXbNj8IgYU1wgNbjgzM022s+oygbdF+xPQXwSn+Jd9LNUh2KbMXT66loBHrR
         fNlg==
X-Forwarded-Encrypted: i=1; AJvYcCVn8lI++Xh2ujPv+W3UwC0LjY7rnbfEifkTDHU2z348FzZHFQRyoKMsIKbNMRd/eSwywac=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5+UikFOfwU7XnplpWzzUvpg8ot3Q3JV6xuNzdQXqD8Kg12cPw
	BCTzVBFvInVdEksn2HLYVjmcrf5l/pOJ1LgFkcy9oZmFYGt3jWhC2MvN
X-Gm-Gg: AZuq6aIo6wUKwaeMtE4iw1n/vjTX/lTzXrWLDHW5h9I/Df0c2gqk0Iz8yQnMY13LmTz
	FY71fmzp8N/5taLkeYlbRmjojXCGy4GVGVvtleJ/UHO2lCia5+9SZI6gYhPbvgbxhNkypFRyZva
	FojQ/zHfvoE2Ayr4JPuzrbXosAOJYi088oPHiCgRbxvILYbfYTY9AILDH3LvOIElaGWQjpNiHQJ
	w91aJXtzYPOtkKrtuAfHHsoSUv4r5wptPICCYoxWCvITvvXQDFcxe5hW/foFjNlQA2x9gSOfgDS
	fwsXVT6EIZ4uc8qKJnbhCxMmlyAeRj/vVx3Hj2xMUk9juHnVxF63H1Qw0GAKmDB1YsNoF7pGGC6
	MEWmhLbyX8HRGg+TmIhSRQbz2JtVSZpBLFqjEmyjKZCYhSGEat9KHY4NmBDJw9pJw/fbIvVVGEx
	yTOC74MlxGTyhSdHKuYj9PS95sLjoheWiA1JsMNQKtMgrU7d8Uzj2AQLi4ri4=
X-Received: by 2002:a17:903:189:b0:29e:fc06:b8a5 with SMTP id d9443c01a7336-2a87130b27bmr8439315ad.18.1769498178413;
        Mon, 26 Jan 2026 23:16:18 -0800 (PST)
Received: from cn1dhc-k02 (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm106160505ad.85.2026.01.26.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:16:18 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	james.tai@realtek.com,
	soc@lists.linux.dev
Cc: afaerber@suse.de,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cy.huang@realtek.com,
	stanley_chang@realtek.com,
	eleanor.lin@realtek.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v3 1/2] dt-bindings: arm: realtek: Add Kent Soc family compatibles
Date: Tue, 27 Jan 2026 15:14:00 +0800
Message-ID: <20260127071530.25426-2-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127071530.25426-1-eleanor15x@gmail.com>
References: <20260127071530.25426-1-eleanor15x@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-Chun Lin <eleanor.lin@realtek.com>

Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.

Additionally, convert legacy DTS-style comments to YAML description
properties, following the pattern from the ARM bindings conversion series
[1].

[1] https://lore.kernel.org/lkml/20200622125527.24207-2-afaerber@suse.de/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/arm/realtek.yaml      | 42 +++++++++++++------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
index ddd9a85099e9..be529490640c 100644
--- a/Documentation/devicetree/bindings/arm/realtek.yaml
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -14,21 +14,21 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      # RTD1195 SoC based boards
-      - items:
+      - description: RTD1195 SoC based boards
+        items:
           - enum:
               - mele,x1000 # MeLE X1000
               - realtek,horseradish # Realtek Horseradish EVB
           - const: realtek,rtd1195
 
-      # RTD1293 SoC based boards
-      - items:
+      - description: RTD1293 SoC based boards
+        items:
           - enum:
               - synology,ds418j # Synology DiskStation DS418j
           - const: realtek,rtd1293
 
-      # RTD1295 SoC based boards
-      - items:
+      - description: RTD1295 SoC based boards
+        items:
           - enum:
               - mele,v9 # MeLE V9
               - probox2,ava # ProBox2 AVA
@@ -36,25 +36,43 @@ properties:
               - zidoo,x9s # Zidoo X9S
           - const: realtek,rtd1295
 
-      # RTD1296 SoC based boards
-      - items:
+      - description: RTD1296 SoC based boards
+        items:
           - enum:
               - synology,ds418 # Synology DiskStation DS418
           - const: realtek,rtd1296
 
-      # RTD1395 SoC based boards
-      - items:
+      - description: RTD1395 SoC based boards
+        items:
           - enum:
               - bananapi,bpi-m4 # Banana Pi BPI-M4
               - realtek,lion-skin # Realtek Lion Skin EVB
           - const: realtek,rtd1395
 
-      # RTD1619 SoC based boards
-      - items:
+      - description: RTD1501s SoC based boards
+        items:
+          - enum:
+              - realtek,phantom # Realtek Phantom EVB (8GB)
+          - const: realtek,rtd1501s
+
+      - description: RTD1619 SoC based boards
+        items:
           - enum:
               - realtek,mjolnir # Realtek Mjolnir EVB
           - const: realtek,rtd1619
 
+      - description: RTD1861b SoC based boards
+        items:
+          - enum:
+              - realtek,krypton # Realtek Krypton EVB (8GB)
+          - const: realtek,rtd1861b
+
+      - description: RTD1920s SoC based boards
+        items:
+          - enum:
+              - realtek,smallville # Realtek Smallville EVB (4GB)
+          - const: realtek,rtd1920s
+
 additionalProperties: true
 
 ...
-- 
2.34.1

