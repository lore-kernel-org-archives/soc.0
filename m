Return-Path: <SRS0=2rx6=HV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA62C4167B
	for <soc@archiver.kernel.org>; Sun, 10 Dec 2023 14:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31C68C433C7; Sun, 10 Dec 2023 14:01:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0937CC433CA
	for <soc@kernel.org>; Sun, 10 Dec 2023 14:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0937CC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54dca2a3f16so6554758a12.0
        for <soc@kernel.org>; Sun, 10 Dec 2023 06:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702216908; x=1702821708; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrhZNFmRkf5QkANQC+uz36bgjgb8UZO2KJuZBL7fznE=;
        b=hLgp7fgKBiQfI4NZfGHw7IPQKohUmYTChcFVxYE5REOPW4BprMfbD2EXlxKfO0tO9i
         XV2UaIgST+/rwadRqbbxaN4Z+Jy3I/qdFWOAHlPHlM5c9BOYCE8PA+EkJhqON1GSRcik
         IVz34EDQ/6HlcuB2aRYE5Hrm+C/11TA5J6abPgtkkVXsosHIi6pyaY0SkfHbPZry2GRw
         FBU2mE2ukeqTm4MoSqjC9vXnryWBv+rqJhAorXXjq+NFFoyLrCFxBNcwbpFKJvOiT7UQ
         fR6XDCkEuP677qM1b1//qjXLtAJD4aI+M4XOVESGi8NK/5THqYA5cfMHeuIASWK/bEwy
         QXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702216908; x=1702821708;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrhZNFmRkf5QkANQC+uz36bgjgb8UZO2KJuZBL7fznE=;
        b=IJ23k0GL1d45yhlTT1cCMwoxnfGJ5soMKrP1CkoRFMyhiq4Nm/a7tlLh0ynJLNQLrK
         S07gEyAFv9mgYA7iDt0sFAbPeSU16lQB4awRgdboVJtcGMJfcLQFEVoXIw72drjml6ju
         DLV5zr+7vxSSAzEKHCQa8737aAGW3pgAhqhSCBrhQ4rm404khDpkZC8u0jB8dwP9qCh1
         CqRPMqUWujUb6TNlUf3GDg4l6np/gnpnlMwyqJNWSmi6GLTHrjB5mWoQPfWyKDVceMh6
         24+HHazfZnz+cvyMzmpvyPZo0XOVVlY73LEbNWcQ+zM8A8rjPSXcptaEcA6uI7ye2k5+
         HDZQ==
X-Gm-Message-State: AOJu0YxIg9FRs02rbzN7J6F6WfFQ3fawe4tv0a8HVMGDiICMByENB62A
	8YPXqENrQvRK8nLdCKWmygjT7g==
X-Google-Smtp-Source: AGHT+IGD245LrSk0xYctz3uy/kk2KvcUmnSUKmb1u8fAYEK0Zu2DWqkA0Pi8IyNUK3s5IFZQRvE6Bw==
X-Received: by 2002:a17:907:280f:b0:a1f:4d21:301a with SMTP id eb15-20020a170907280f00b00a1f4d21301amr3987023ejc.13.1702216908355;
        Sun, 10 Dec 2023 06:01:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tg10-20020a1709078dca00b00a178b965899sm3458691ejc.100.2023.12.10.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 06:01:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231209233106.147416-3-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
 <20231209233106.147416-3-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v6 02/20] dt-bindings: clock: Add Google gs101
 clock management unit bindings
Message-Id: <170221690550.46013.13677086533521441233.b4-ty@linaro.org>
Date: Sun, 10 Dec 2023 15:01:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Sat, 09 Dec 2023 23:30:48 +0000, Peter Griffin wrote:
> Provide dt-schema documentation for Google gs101 SoC clock controller.
> Currently this adds support for cmu_top, cmu_misc and cmu_apm.
> 
> 

Applied, thanks!

[02/20] dt-bindings: clock: Add Google gs101 clock management unit bindings
        https://git.kernel.org/krzk/linux/c/0a910f1606384a5886a045e36b1fc80a7fa6706b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

