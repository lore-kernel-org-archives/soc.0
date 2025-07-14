Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFF1DE4E1
	for <soc@lists.linux.dev>; Mon, 14 Jul 2025 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752509895; cv=none; b=eKwnRiI0sjF/sjfJ+zpGS9f4hvy48rEKiI5eGASxNfAc0l4YgqpFba1i8EV+qZj0iMXKVVqtnQJ3Wy/1b84xmnPi2Vy+TcZXZwHhmuVqcFXoMk8kuxPqgJJsN0Mm+SbCvhg/U+m8CLx7N32i6rTmlcWQIByB9bn2GAkXq/eo/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752509895; c=relaxed/simple;
	bh=pdVayYs4+ZkLExX/qHuVNHe3Vze439YlELoMOMvEfOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYWlvjsiOPFpeOhMjUuCW7bHX6aOliQzcMTqQ02GhwrwMlbnnPa1KABwjmFHIbWHSOzVrmjIZIpaX5lAY3S+0obdcvfNdRj82i2rx237l63dX6u5XV+9q6YG2j4MBhK3vSCpAn+1/ibncMYd/FIYR7jsCOwMv07p2SKjoQMFyn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x8fBPynt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x8fBPynt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455b00283a5so18202345e9.0
        for <soc@lists.linux.dev>; Mon, 14 Jul 2025 09:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752509891; x=1753114691; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wC6A1qDuM61Boa2KQZ/UgUYnzAlF4JWnuO5cBexQuGM=;
        b=x8fBPynto8u3MxhX+GSrZHsKCm5nQK1u9WZNXN84nJvCr5ji6by8mxYXeXvkGsa1BF
         1jAvxsTIWnGraIC7nzdhiTRT8ItZMISV40J4QU7tfGiaawQfH7jK6He2drpXD6ZFw2Wm
         WHaO0yBzm4pI6dqDPTD7I9QAwWb9eJkdRlAHCJl8FrJdo0UnV97xAivNp+X5Vi36uBfX
         3xdZx/XWe6R30uQ7CYWZxiKbqTqqtSIaLHN+gAQz0BS6VgUtk3AT0g9mKl0zOJHQqFw6
         +mJ/m0+t6ctVvVSt8FfvQ+hjSN0UPFSrIJxyHzasv8kdFY9enEztggwG55sZsBRT4O57
         GsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752509891; x=1753114691;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wC6A1qDuM61Boa2KQZ/UgUYnzAlF4JWnuO5cBexQuGM=;
        b=JT0uS7BnX9Ed55IURJMKl5LJQFmn4mePSBeWmRZkvChCHpRfPFmtxGI2QTHiK/jK1Y
         ImWxnKQW0tc3WYSOA+IZ/fJMzV+hAHdU8mkN1JwGphVoJSu2mIKelVNoYAbVOon0875o
         5eXVVpqN9zEyhOXg5UpbM51epj3SY+K1xIxjIWjLvSK2rGyTmevoCYmX+KEX8yVoLg1v
         MJznLqR4m7OsOa3X4o7S7pdSEDFswhv0STnVcK2UF/4QXFujcnwKyfoxD29y2zXR705R
         zH70fZH2iWlIrJhbYkyKdIcsk0CKCnbcw2ldnWOlS2H6s4W0By/LoJJAmXpuGqTtg+tx
         0bUg==
X-Forwarded-Encrypted: i=1; AJvYcCXS8tr7zciDBJK4Te/Y5yxKO9jZg4kAQ63xpBSQRcWVD3vgf1OC+OXotigo3EOzoqMi7jA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUBEbmwbodmfxqiE+qycJoNWImx0n8zRJA7byQeunJDaKrbaVv
	h80CT5xrfA7/h4TnTjndGsZy1wCg0U6Wr8IpaeiMkkhP0a0iI49IR0xn+1yNymaQD/tQrE0FXbE
	f5gAZ
X-Gm-Gg: ASbGncsSvsVxyuSsvqB+i8qy3Z5O2+mi6Auq9nlX6p4Ib3LAOuBPn9PUxzvQuVkAeiW
	KkbLPg1r1EB65gT0gkoPEk8pxUV3g/FH8vXnoJ2vVh27XN7rw1IcDxf7tTk4Yb3iW+MxwkUz+rw
	5xQzg8wdq6FhH8O5SFPZof5zmiWh0BIK5hlQNGStYRrKpBCp8hHffoA7AJbodhA2o4lZhl7ApXH
	mCysE7nlSlvw609j55pJ+Tdfwmblb7ZXWLYAgG1nbqpyWr9dwuI0RVGatHMtVRx2XewWI//Lgd+
	Xr/Zdvel5kM3rgOMgM+Xc/+hw+S/OF2RNLto3XvUGQWYfagcI2CyqzLPcZquNF94HQK0h8g5JQK
	/Xl1uCsHVt8uacO+gSwXx9UkjhQTbS8oRhET8I9H8yShn0Lnb80kxphQQI1Su
X-Google-Smtp-Source: AGHT+IEkmiG1TNOouwwaTX0kWCFB9A80b7BdQ4qTqaPbflHAQ00Io1IBCtMbf19ehPEJdtKq4KcxZA==
X-Received: by 2002:a05:600c:5406:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-45600771e4dmr84656845e9.5.1752509890844;
        Mon, 14 Jul 2025 09:18:10 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5103c2asm173612365e9.33.2025.07.14.09.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:18:10 -0700 (PDT)
Date: Mon, 14 Jul 2025 18:18:08 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	soc@lists.linux.dev, tim609@andestech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: timer: add Andes machine timer
Message-ID: <aHUtwMnUwHIPn-sD@mai.linaro.org>
References: <20250711133025.2192404-1-ben717@andestech.com>
 <20250711133025.2192404-6-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711133025.2192404-6-ben717@andestech.com>

On Fri, Jul 11, 2025 at 09:30:21PM +0800, Ben Zong-You Xie wrote:
> Add the DT binding documentation for Andes machine timer.
> 
> The RISC-V architecture defines a machine timer that provides a real-time
> counter and generates timer interrupts. Andes machiner timer (PLMT0) is
> the implementation of the machine timer, and it contains memory-mapped
> registers (mtime and mtimecmp). This device supports up to 32 cores.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---

Applied patch 5/9, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
