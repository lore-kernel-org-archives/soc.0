Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D65241C86
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138835; cv=none; b=aIA4JvDDHPIA/IH8YAByrO7IDSp5V414AEt1UgWPsFO4tpvu/VnxAYwnngWp2wcjpdbaACEQ7/NNPPiXnkUXm0btvQlmbJw0aUfIk0W3+pol/mPj0LCeZDrelIebVBOc1XaZ3Fxt6blbm9iOjGPxMe9R3cb91ETpM0tYcHbfhAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138835; c=relaxed/simple;
	bh=t+MEcyEDzmxjBv9SK0gxt9t3iAQ72gz4bhKsUugOYTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ne0iCz2kORvxrNlw01KX4xxnBHlZ1enofFnXOojuKMFkdzqKChf5tHt1IDEix6WoEzv1tGVxMly14IktF8mp4P97Rd1hKIqya9h1Q+bPbzUy5n9Hvkm1oZOULK8sFNG3PyxscYl8IP/N6vXfL5jeHLaHcigZrBYL8uwfDZSpVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IB1Zw+v0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IB1Zw+v0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso640955f8f.1
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138832; x=1739743632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKk1eBFoHmDcld3Lfx7t6YPL0jmbrCaQqUFUOUwjSIk=;
        b=IB1Zw+v0S+cZgr4eWrOzAay8R1u+W62HEAWTSPhfMYacTykpQ4uL9CA1AqU/zyA60n
         PXE//1mneJyee031y7+aagiifS0H92k8fWTYX569R4rTUK5U91xpzSEtqrrf+dKjSF1k
         VggOdZyOcsscvVLk3zlTm44OQMToNNbWMySQsk+aqMUpqTRbtCiI+soBEAnQkOC7HuEE
         PVxMT68MpdXULlq35RTQ2wMcAa4GdmPrgk3sguJom0CVc+ErU+s3lwnkdRaEdTbLDvup
         sAddIRnb3JN48iGPU746WYmalap+8F7KDQfMFxAkRAzUgOcmhRvIro+n3mJ4OUskFc9J
         sjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138832; x=1739743632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKk1eBFoHmDcld3Lfx7t6YPL0jmbrCaQqUFUOUwjSIk=;
        b=ojRFgQ/e2YSfEePC3Wh0iYHz6KG0TipvGT/cocP0gG3A2jbcW/ZKfP75r8O2/+yvEQ
         gKwcJ+OSTZ3Kt92BwfAjfBy5sqakB5bMUYP9wrq7uKWH4l3cIExkH1T2fJmt+4GHu3hR
         2zgcm+l0U3LzhcaSwQwnj5DLm3/ESn2Vsg67+t7v97eWNalfndVvGSPjXXbxNXLbvlJh
         tIfsbafA/F5fkCB5Wx0KfviU+ptvrH/CgFkKeJBbnTnrGzrRi11p7/KOR8EPN8cR5lBH
         f4yFMnWZkrOZ9ImU9Qw2PRwYH6o9A7h9KENa7JmGLlJ3r+gPmbKfCt35gP+QFNJxBBer
         rs9g==
X-Gm-Message-State: AOJu0YxNUVRqolVufFydfWQyLNFm3SvTx03Ev/u93JKTrTg5/j3hMYcc
	T53SbbHo1Rmo4DR5unWzFnAI2Bqoi/xQe8dzUPEMS0MVoijZxfXY5IFFHnAb
X-Gm-Gg: ASbGncu7MDbR0JEK8zvcYXM8zrRpqu7HsgcqX5ARH00iiOqZgkIz3leJZJZRu5N905J
	eef3hm2MZDup/4Bqwg8spQfU/FhK6pPzRIbVPUJYshtNeV2kg5gdlhM5Anb11oXOLovLRfZrna9
	6AtaiWXAIv3lD+ETGLMgq6EkAnfY8jPrEcENLN+jvOQscXbjEDU7JE2uDcbwRAgPIshpz1BejJ7
	MX2NroHeaxU9r6jy3CfzWeBUWvfErFz2ok403i0R4oTnIOwZYoXbP6XCYqAE4Dh21L/4wgDdT8b
	BVtoY7yy9DimOdRvPN4+KtnN8ZPp
X-Google-Smtp-Source: AGHT+IF2Bns6I6YCSe2LhsETO1BYlvvXG98BlhUd8nZAEcFJtGt/bc67HK+7TnAd5oXHt9YnANZ3Nw==
X-Received: by 2002:adf:f70b:0:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-38dc9135d53mr7026781f8f.36.1739138832176;
        Sun, 09 Feb 2025 14:07:12 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:11 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 08/10] riscv/arm64: dts: cv18xx: Add sysctl and reset nodes
Date: Sun,  9 Feb 2025 23:06:33 +0100
Message-ID: <20250209220646.1090868-9-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reset controller node and required sysctl nodes.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
index 53834b0658b2..d793b6db4ed1 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
@@ -309,5 +309,21 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
+
+		rtcsys_ctrl: syscon@5025000 {
+			compatible = "sophgo,cv1800-rtcsys-ctrl", "syscon";
+			reg = <0x05025000 0x1000>;
+		};
+
+		rtcsys_core: syscon@5026000 {
+			compatible = "sophgo,cv1800-rtcsys-core", "syscon";
+			reg = <0x05026000 0x1000>;
+		};
+
+		soc-reset {
+			compatible = "sophgo,cv1800-reset";
+			sophgo,rtcsys-ctrl = <&rtcsys_ctrl>;
+			sophgo,rtcsys-core = <&rtcsys_core>;
+		};
 	};
 };
-- 
2.48.1

