Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49C26A1B5
	for <soc@lists.linux.dev>; Sun, 31 Aug 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646902; cv=none; b=q5iWPodFMifoy3i6UnytEQjLTijKH6POGu3YgTmqshoAHrMrR+Vj1gFe1XOjUBGHRPg3obInrMZzqpMRe13uLnTcK6idM4wvjb6lLitw4N6HNSfjxvWThwxVn2C/2V5Z7eWfTHdSzHZ8SWiVK1jRdEJkNV6VpVQyr5qXR15q5KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646902; c=relaxed/simple;
	bh=LdivQQ+HHnZWD9LIPqe5v9pOuvWPc7P5UYV8ZAoOTho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Iz8JASZmtWyyVOjtojY8qNeTdjR4vJMMKGQdiJ52J+J5+mgVsqKqI82V6KziT3SnOekT6MszhtM1jQ8XXZWpyChv34EOkktBOf7VzNTL7KcNw3iqfpeypV0/Gf+hGrs3dX1ZxNSNntGAE9ZhcKOPtxRq9wnaEq8fnvCeOu5Ni9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jWuXJx+N; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWuXJx+N"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3cef2c300afso410818f8f.1
        for <soc@lists.linux.dev>; Sun, 31 Aug 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646898; x=1757251698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=;
        b=jWuXJx+NVZ0zc7ymCFi0Wql649B73gfwGR23liqBt9dYb1vhMHXyksmaAnyrgxAOqi
         XRhJGPstP/dnTjkTtRoCBBlq8WG5j+i44pGOx+DZhRQYxInG0fxc1FtDOCdhRcBJSZGM
         IVp0EoCC7ntz9Kpxf23iuxdEBfYsG+0J2lHAc2Pc+MiJyX05BQiBU4T7gQSvHVjWqdU1
         tVmz42RYGt739u93XmHlD17Giwg/tuwrMVWSFsOIZPv/Z0IlRyKjIyFc7IYJFgRPBO37
         moYhtemefwv4KmoQTRTGhi4ZOpKtUdIwsIHhdXflmjly4FkGuGWNRwq3hkQWUiKqE3bQ
         kG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646898; x=1757251698;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuVblRpOdjWQCfpwKse83LT8IgPkp+MhNhnqf1geLpk=;
        b=Wfd9kBz9Ns1HkQggu+nqWCssAg2RrHrqy5ma3UWqEWzsA/VF615WT2UaShth9TH0ch
         s4W03q5hvBJ38zOcbK3j5GMcDLClxXtnYlhpt3vAMXYWjlxL8OKXasHuZ7VXTlej4s0D
         veRgWq+pV5339fFnOlNw7aSAG6WnMNz5RQm0glRODFvOVEay9kUOCAlDxqPT0JRmx/i3
         /r9TNPyBvVMTwfeN7mB6ZQfpbOCuzOGRDeqtBi/PHG/KeMsrYgQB6zkhG2/d62bl0/GJ
         9+k9ACWHZdMSXoyoJBh7q1kzj2vsHux+WrHdZokG7gqqpGnd7ruplMUXgNr5SoMJ1oHk
         mZDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT7VOqWLpwdOJNtkYbexCHhw1XIf4TuRouNQyTRofDGDBt/7Jtapwby10JKmV4iAQxXa0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOXtbul8dzu9cZOu31EY1DeuRrxt3zB6ks0wI3f6y1RVsG0fOq
	yzH6/8WZn99DZxHUb3LrgLwdOD+tV23Zs63RUtSF2OsdBqVkRudUzP04hUw1NSomfY0=
X-Gm-Gg: ASbGncu7PljptxBp9wr3U4B8aTmDBMsEu7dfOTJVWiPEUEw6KXu6c1iQ6fwUwJBw0II
	yuKe+4XQAhUc2oFotaS5JQhjEwFIozqqh8dvgHn1/xYAaeR4PWqf18i9F/+437h6V7iP6yJOlqH
	QX+UCeSm9NjEaKQZLvwd8+K5CpjVEgmtbuPu5a6spBdehMMJqyjj5PocqzR98f9ImpPr7zCAjK/
	v0px6Vr73GsAogseUyfY/q8Necr8UueC5hEd8XxUJ9RoXF6/K312zqFrZCDQyLCxncZmp8WZcrE
	KUoidsLhHutpDuUYi6XYYoqQTHr7JSQcpL+tzAGgzpqle2tyhDEEymnU7LBF8SElVeosYUQvofu
	S1c8dcH6AzkSrH2jLQuBFmy0hMkFlc6NvSfjQEnWCZYGmAarw+FDM61GM3mTV
X-Google-Smtp-Source: AGHT+IGjjCRfDtUdQVx88kWUHZJxBBGxwDC32T0AevVKpXcpfKjnIqL3cEb2Sd3S+uivJb0HGuqySg==
X-Received: by 2002:a05:6000:2dc7:b0:3ca:6c06:70f3 with SMTP id ffacd0b85a97d-3d0f967dfa7mr3081239f8f.1.1756646897869;
        Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-7-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120725epcas5p36cdf2c4e839db307f1cc0dc81346b913@epcas5p3.samsung.com>
 <20250825114436.46882-7-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 06/10] dt-bindings: arm: Convert Axis
 board/soc bindings to json-schema
Message-Id: <175664689576.195158.13430798793147668085.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:15 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:32 +0530, Ravi Patel wrote:
> Convert Axis SoC bindings to DT schema format using json-schema.
> Existing bindings supports ARTPEC-6 SoC and board.
> 
> 

Applied, thanks!

[06/10] dt-bindings: arm: Convert Axis board/soc bindings to json-schema
        https://git.kernel.org/krzk/linux/c/ea0484e4b82b3496310a94684dfad5e61421f633

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

