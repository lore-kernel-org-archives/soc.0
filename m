Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288CB25BAC4
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282474; cv=none; b=eXx3rY1+m/VqYgrs+VsdW67QuGxkntWV8NfnhVu648JpPhsd24wypELNEM47ECIm/Yk4wrK8SbfQiY4jpM/+cw5yEQH8EPbbMaEeWFD1vwu8nqX9cYnoNThSMgp2TFllN7UfBBMauAhgDz2DJ38MuqJ6StUEoEgoc9vh+fqUgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282474; c=relaxed/simple;
	bh=QhjZjPi8Pu4MuaZELNAV68zJpLOkhthhs/bKYjykGQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IR3izuUsFOribuUPv8SXXR4dFEcNPFoiAJLuQTRtLaoBJTbRWIRfjcFEBmisjQqo+ecbWYEDiXpwYcvpYN61w6/04pdC5/8Bm4URcXc4osVMPFnHOHpLihIteT41dfFhYVGlpi9FHuShOJlb3PWnsP0MWZeIv3Dk74L9QqbqT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ4UYgEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ4UYgEB"
Received: by smtp.kernel.org (Postfix)
	id AC105C4CEE4; Thu,  6 Mar 2025 17:34:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E1EAC4CEE0;
	Thu,  6 Mar 2025 17:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E1EAC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39127512371so708375f8f.0;
        Thu, 06 Mar 2025 09:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282470; x=1741887270; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klXCq3m5VWm+0HPJRbYO3amBiaqCuvTQ/FZ8TPHnVFA=;
        b=ZQ4UYgEBR0w5mwNRZk8zLWm5u8XMpJsKek27pfx3uQd7xcihqINtRUOFs0P3/7cTS/
         JO7402FlWIg8na+4Ugzy/fFfXP0uxeqF8+VCe6eDnCXo7/y72ylw43OtXMnTRyDElBWW
         iGG9JQY+1QAsgNwgg9QAN8QMzAMojEc+MhbP3H1UoUIPHKHlCHIGJRs/Qi/iSeMIiCxb
         Au3rQwhnBdVN3mWK3RximIb8yo7qEW9S9tw+uWIWmI4m9q1mGhoXHTr7piXkYMSchVhr
         sqwQjc13Zh+h+EjZv3kcZoYRTtPTopThbWdjS4rd85uv4aLtqUQNAmyR10kppkwWnuTE
         th3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282470; x=1741887270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klXCq3m5VWm+0HPJRbYO3amBiaqCuvTQ/FZ8TPHnVFA=;
        b=xLTZO1MgcN54jDwsyznRLjc7N7IjVFiDQOzR1cLZZ5oAS0rhYApNM9nfB9RnTAx7uY
         csCw4IllvnKIZW91VOVViW6a3PFYuaxAOyKpbyjmygsGAtYB747fNWonbcMic/mV/q3n
         NRv5bwnQLpOhvdlf96/0iP4iNXbw+3q+3AFt3a4/P7pbEuf62I3uFZX073iw2TRBNqRg
         daa4Xf76xA7k19tyX/2yA0NSdYPo3o2EnNZaMwZYo+H0Bc97nFpw31cTwPUOAWYllFii
         Fz8KD/sYtUalJKZCEXixZz+z3tGtCsYipK1jhVjZbjlAZOpkpT0CRmNVRs+yTYJSJ/iq
         vJlg==
X-Forwarded-Encrypted: i=1; AJvYcCUD5+OPfasLEJDR8g+WD15SrBc9oTcry98+3+FX66xZL/YO2FqPcerYjHuvImDPRv6V8/NL4Q==@kernel.org, AJvYcCV9eXnS1IYH8BNOadBM+GoTIMvxuV49RnfyRs+bD4DkBbZGUmIO/JhE5jRjB97aE5THT4oj+Q==@kernel.org, AJvYcCWuldZQ9w9dAy14Wps1k7gJ6nsXWYd6214DSIlaG2iLoEGgYnY086hK64k3dBVbKYGDzF48Uw==@kernel.org
X-Gm-Message-State: AOJu0YzTsDb2cKF4NKQMc3bM0rmYnZFZDhb38KkbmrldxK8JdeSApWpq
	6X/SemF9BcG8mRM88QvZ2oO3lIcWdwCqqBhpEmi4Q1Yeok45UaVtRxWfkw==
X-Gm-Gg: ASbGncupTcQQdN3SyGmvXLw7NC7+wKbdU7rcj3y4pl3DMFv1tp9fKDBgZj8zTLyWka9
	iajH6/Osrt/nKz3awqnQZdRDlScvCHhoO09PmjhiiR6WMxIxUmuMjGih/gYXD6cLs81DLqnjuwo
	137JLnWIMn0B7d7iZhrBpnoKIEKd7QYz/9mM43IJFPTrEqA2zdiPxH6d7dZZWzGnbcbApJPz0Rj
	2QNUS4XKJDgFX2WkPtfKB46DqT4u1yMj3yKKgwcN8jKfwUUB0AYRLbOX2HKGwqJSY2z1ZpaAOYe
	+KPNDMWjhzdG2Va2Fs0QRcQJt9SJjbh3OgVUnKQBqaJnS33zHWMSoszIfzxGMa5Wl6AK5RRSU+T
	c/3znWNpghlsv1UWUBvMWL5rj/wGlmN8lIY2H
X-Google-Smtp-Source: AGHT+IEnKllRb/k1/H98dNGUZJ9z50/qfSr+qeIFuQxpsKNHvLmqaCrlFdFgoQXYNB7IHYqXWxdlKg==
X-Received: by 2002:a5d:64e9:0:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3912192cd5fmr6881752f8f.39.1741282469939;
        Thu, 06 Mar 2025 09:34:29 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfbb4sm2738249f8f.30.2025.03.06.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:34:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
Date: Thu,  6 Mar 2025 18:34:22 +0100
Message-ID: <174128244841.2024061.11431672640522584852.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305224952.2995841-2-robh@kernel.org>
References: <20250305224952.2995841-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 05 Mar 2025 16:49:52 -0600, Rob Herring (Arm) wrote:
> Remove "regulator-ramp-delay-scale" property which is both unused in the
> kernel and undocumented. Most likely they are leftovers from downstream.
> 
> 

Applied, thanks!

[1/1] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
      commit: 90a1dc90d08bd1b8a324d4272d06d74525f51409

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
