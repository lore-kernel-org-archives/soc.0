Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB01D337688
	for <soc@lists.linux.dev>; Tue, 16 Dec 2025 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765916877; cv=none; b=lFrirUCdH6rnWAsPto7uzQvtWWsKDknbY/YDr1ARyQ2aXm19m0o57SeBS3nIIt81EfP0QyveJN/HSTpDYZY4pXqjtGwAsz8pxTdiKr+9zQAtbLslh5ljWoZGrYB6je04P4K52pGoJoXPILA1zU//9zzcv8KTkxHRbzJSvso80mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765916877; c=relaxed/simple;
	bh=nBTDF3/uUj7IKrau5JWlg4DXZ8gHk9ySQ/8sCCPBghA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUG1G8xpq9/3XM04VjO6qJRrfEet0ChG1G3Ynh+9bBIRQxsxmWTcB/8dDBV9/X/vfLHsOHbHjDe/tOCPcZ9kqJV9PZ3eVI9W4idKtxAPnKqXUmhGj0FyUh1zhPa2YiUYVGqKid7mUUpr+iyG/PJDpWCTNl40dsgnxQ943MdJrFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhG0Y0Ka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhG0Y0Ka"
Received: by smtp.kernel.org (Postfix)
	id 87C24C4CEF1; Tue, 16 Dec 2025 20:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E059C4CEFB;
	Tue, 16 Dec 2025 20:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765916877;
	bh=nBTDF3/uUj7IKrau5JWlg4DXZ8gHk9ySQ/8sCCPBghA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BhG0Y0KapOtsqA8MtNTiBm1pHI53Qx1zqA5y+u246SavhjVpZTLQhYP5pPhIHyFy8
	 ZdbOsLwxwk50D8SK/agEftvVet3zOGuF8vwL5fAYxCwtomteSUOg+m4Y9WYvRbZIb9
	 0v25UZzoEX1nhzIoMiCm6edp26JuAb79/JMor8Ab13CWzr2r4QnaJgbDmJiATXqW9M
	 ILYQTjBiexFc0P1IxKbzAZlBLoT2eVcjUJJl4I+IGpbMqNka+VdT8lKwDY7W/JqDW9
	 +GWx5MXjUhI4C/vaYVfJLELI9hVINBZTuAWBOkv+U5bNVgH1M8UbDByelP1n6ySVha
	 QxH3ntbXYeJKw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 16 Dec 2025 14:27:49 -0600
Subject: [PATCH 2/4] arm64: dts: apm: Use recommended i2c node names
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dt-apm-v1-2-0bf2bf8b982c@kernel.org>
References: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
In-Reply-To: <20251216-dt-apm-v1-0-0bf2bf8b982c@kernel.org>
To: soc@kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

Use the recommended node name of 'i2c' for the 'i2cslimpro' nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index 032d37a32193..95281268fb7f 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -224,7 +224,7 @@ timer {
 		clock-frequency = <50000000>;
 	};
 
-	i2cslimpro {
+	i2c {
 		compatible = "apm,xgene-slimpro-i2c";
 		mboxes = <&mailbox 0>;
 	};
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 4ca0ead120c1..85ad18b63038 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -134,7 +134,7 @@ pmu {
 		interrupts = <1 12 0xff04>;
 	};
 
-	i2cslimpro {
+	i2c {
 		compatible = "apm,xgene-slimpro-i2c";
 		mboxes = <&mailbox 0>;
 	};

-- 
2.51.0

