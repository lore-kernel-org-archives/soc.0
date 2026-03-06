Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F136B059
	for <soc@lists.linux.dev>; Fri,  6 Mar 2026 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811102; cv=none; b=T9SfFbAVDbriIAR3n7U/R3UrhhFjKj4b4aVM5fMvsZDNwGKSZy1JOSVgbgNflOOXzfA0jzkJApUv4uXjCLqnqSS/LpgDshF20CIXWRVOLeSnQFU15SrUq74tGUEgdq798UKzomwirsgKLzi59bm/SzVtovfMpb5rq4z7PIvYtOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811102; c=relaxed/simple;
	bh=K54Feh0f9P2/C8XDds58ZJ6/9dZ6sc9mvXKVseax/4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KLaAwKc0lAMmPICzNHhX4qJcoEZIzVQ3mxkNXqmlg1/My3wLmzUNsEgUOj+cF/qKvcVRKFkZY/Q911nmnz7yKi8Yqk6zPI3qMnB53E0JbpZ41W8mEXqmBVp42LQsAtnSYLanbnMavoHSxs8aeQAZi04Vk21Ha0ri3UB1J6pBIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=FghcCxJG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="FghcCxJG"
Received: from localhost.localdomain (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5446622A3A;
	Fri,  6 Mar 2026 16:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1772811097;
	bh=oKbch+KhkvyosRD0j6QhDe+o5sMa38/e30u48THoCP0=; h=From:To:Subject;
	b=FghcCxJGAh5ajqHSqacpSD8/LuALJYMy/9FSxbx0TWrnNAc8fKCSijOKI3AEl9xVJ
	 ZrJ3m21h4IRuJfxaCXxMvDg0nFtbC83Dr8rtc6N3AoXEj5c8nJ8ydC+GKwsXkbfPBA
	 PRZnaQmiegimKbQOPOEcyeJdL9+4KZYTWKaDE9VcHaHdI9Qu71ZWkneNB9UhLJZhZa
	 53HWptRrKGhlWOXggdUpR1fBqiSSGAAMmMPliwGnBoooqm9uR1HNF7ZGHwwBSRzmPq
	 u/z6/EKPRm9U+NgrHe4pJXkNqM1l1sczQl65KfVhuOmnusKQqlG3fsCFfnHlelk8+t
	 kRSTeVoOjsmcg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Subject: [PATCH] arm64: defconfig: Enable configurations for Toradex Aquila AM69
Date: Fri,  6 Mar 2026 16:31:17 +0100
Message-ID: <20260306153130.102972-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Enable the configurations needed for Aquila AM69 SoM and compatible
carrier boards.

 - CONFIG_SENSORS_AMC6821, needed for the fan controller on the clover
   and dev carrier board (as module).
 - CONFIG_POWER_RESET_GPIO and CONFIG_POWER_RESET_GPIO_RESTART needed
   for poweroff and restart functionalities (as built-in, it's not
   possible to set them as 'm').

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4ed70ab7ee85..af679604d9ed 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -729,6 +729,8 @@ CONFIG_GPIO_MACSMC=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_SL28CPLD=m
 CONFIG_GPIO_AGGREGATOR=m
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_POWER_RESET_MACSMC=m
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
@@ -757,6 +759,7 @@ CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
+CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_SENSORS_TMP102=m
-- 
2.47.3

