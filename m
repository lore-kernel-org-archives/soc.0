Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51B18A6A6
	for <soc@lists.linux.dev>; Sun, 19 Jan 2025 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737314182; cv=none; b=Wl/isy6rUyHeVzPbuCaSpDDmMeXPcYPAD+dMkHeFVGe6a34k+k0PFso7z0Y3LE+n7PbpLPODxHsRTIXEJtP3Mdb2aa4YiGo3qwsC2oAoF6rLeuk9SOT/v/WuQHPxLg+5blfX4q0fVP/GDO8EDg3xFTP5InlEJSfp6zMxJY2Khm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737314182; c=relaxed/simple;
	bh=PP4m4zqpwmd1ngg6HWN/umoJtUyT8y4HjYfNMdox2l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swafnpwn0YUH1PPN2gR/qAoQi0QNL1RGu6i96mivtDj2SvyDxVtm5a7W4Cayx0q+KcSeHm1V+1XkCEXjfod/HNFgKKx5MG89DEzwUmtu2xvliZV8xr/GVpwgLN9shLS4xlVIhBBPGr597KdFWhacYzc8SGMlOXArMICQZW6sMXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5mnHu9I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5mnHu9I"
Received: by smtp.kernel.org (Postfix)
	id ADF6FC4CEDF; Sun, 19 Jan 2025 19:16:21 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4ACCC4CED6
	for <soc@kernel.org>; Sun, 19 Jan 2025 19:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4ACCC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-46b1d40ac6bso34122241cf.0
        for <soc@kernel.org>; Sun, 19 Jan 2025 11:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737314179; x=1737918979; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xu41P9de773e/9cu60iL6PZJC3QjQtGofbu+cqUbtZk=;
        b=S5mnHu9I8qnLKzWcu0ocE/Sfia+3iiPk8zSAMU2rPp2ZcgQJan+AE/ZgshuHoCj3u9
         uo2TykCGca4mYD/3eI+jhWrgtcpYs9Pb6cpPoCO9YRceRwXx/LsftIW8t+qPwuLIVDzL
         BFsPq/iI6ozepS6hD8bTofKcrO7z1W3isKSDBymS0FsJ5/gDYXw/suJrKh01/ZKALliV
         HfS3GfR3YlItE3fflU4tyd0/v6r6VB3h0awI5KRM5whLuiGhjz8I+Rr5NYUAKocRCu9o
         AlDQAV/Sj6v429wu6/Zs1/tdik4pU06ne9Pvy9iPMfamJMu/QbIm4jz5j3CjAm+0vzI0
         4ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737314179; x=1737918979;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xu41P9de773e/9cu60iL6PZJC3QjQtGofbu+cqUbtZk=;
        b=fREYa/sxotdXMkraaOrzrDaa7a2CDG63/aFQsbgZ+Im+6aSe3fCNz9ECqzXbUqlFFF
         oEQsLPyLMH1R5OtOnjPyqm2SnsKF3PTNcNgwOkFl+B32XiL7fAp0KspuGzJANU+j/LlM
         5yiBFp686PDGAcrjcYLQ8GhrO33ElzQfp8igRrQf/oPZCddm3/gyCI8HNhobFbPSy3+8
         A0lbRiVXlYAVdP/vQKu7oRxL+hq/35CNph+RqA9aku9E8UE1eTxerQgOaHJVSSx/dIdV
         8ZUFCesA62QWiIB7C/cSPe5gvXMQod7PAdbyDQfB2uLOI8gRlqXVnQOh+h/DAjSTQY8E
         O0ew==
X-Gm-Message-State: AOJu0YxZ8UYj99lPKVZent8rI0xv1CqWFSiiCz/TuARt6V14N/aP4rYQ
	hmXImLVkPNDcG2aPyMPSk4KHd3D6GKmzgSjqT01ZvkelBeOTa9qK
X-Gm-Gg: ASbGncvn6WLGNQwJ+7hvb+S29rZ1LixIyCbhHDTnAzlxgOg7mPRWGaVNR99ph32ppJj
	SXZ0In4xlm4lMIskyrfKE5owrtQV+K+i8yr3NinQ3ynOJcuL6N8Pe2zJmjqkGh/dEWSELSW+0/e
	q2W/XbneINs0wYQJwSo9TJJl5/WQxb+p0gOSZibkJpswz7N051jemmc1qKkfqRS1TwbAOdiNkw6
	nVgZ68rAKZyy0aYRBj4fMJ7zzFu0HdCjY70P+ol/tGFurLJeEvTD16fvRhjLvpEIvf2kos5F0J2
	PRzRgfmrWIrrLEZR9DBDC43Fuqu+6QCPeQUZh3rDp0yF
X-Google-Smtp-Source: AGHT+IGCfUIzNwSMLrQhgicAN6TluHUnsi9cCJ5/wUUw8hAvgNFrNJgsYLTAYi7s3CuRpu9CwuXlJg==
X-Received: by 2002:ac8:7e82:0:b0:462:b7c9:10e with SMTP id d75a77b69052e-46df56ad204mr294173671cf.13.1737314179611;
        Sun, 19 Jan 2025 11:16:19 -0800 (PST)
Received: from errol.ini.cmu.edu (pool-108-39-141-40.pitbpa.fios.verizon.net. [108.39.141.40])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e23430fa9sm16190081cf.4.2025.01.19.11.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 11:16:18 -0800 (PST)
Date: Sun, 19 Jan 2025 14:16:16 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Davis <afd@ti.com>
Subject: [GIT PULL] LiteX updates for next
Message-ID: <Z41PgCffqPUTyxkE@errol.ini.cmu.edu>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett

Hi Arnd,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/litex-hub/linux.git tags/litex-6.13-rc1

for you to fetch changes up to c7345869aa382b1e22691d51cbbd218d7f488a55:

  drivers/soc/litex: Use devm_register_restart_handler() (2025-01-19 14:05:35 -0500)

----------------------------------------------------------------
LiteX updates for next

Remaining LiteX updates from 2024, reviewed and
successfully tested against v6.13-rc1.

Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>

----------------------------------------------------------------
Andrew Davis (1):
      drivers/soc/litex: Use devm_register_restart_handler()

 drivers/soc/litex/litex_soc_ctrl.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)
