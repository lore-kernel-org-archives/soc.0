Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9ED189F43
	for <soc@lists.linux.dev>; Fri, 29 May 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053277; cv=pass; b=cLtLy0LCLiQkVpCscUvWrIggJLFgZqD9dyIrIG62XDLR78ETByMa29c7E4bJaaShNE1BaDhnh4LFff8nOP93SG1MdilrLAjJk8ks+9AggTjezXsabovTv60IX6FIPctUcb+45iwJAE3UpgiXPm+Fa210XDpArF4iLXpoahn2Z9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053277; c=relaxed/simple;
	bh=lQ0Bx0AMoAMn5apow14nuTdaJpbXsxOQaZqme/EsrKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R49KaTREtfgPyyLdc1+QafKpNiKjoS48CtMt1Q0CpOC3aIX4UJl9LMYk0jDyHpZ3f+uaju6aZ/5KamISfJDDY30VnNMmOiBqrLD/1EV5qqQja88YjD1WzdiuU9kNiaruKxvc1nsPXlFZpm0TmJPLr/UzYHOdgDd9VYo+7opyEOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZM/1Ue5L; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZM/1Ue5L"
Received: by smtp.kernel.org (Postfix)
	id 0BF871F00893; Fri, 29 May 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780053275;
	b=j7TdW97/QWJBEjsUKDL/jb2HVgG2NHVkSj3X8WZjbLgTCFRIXdCnpB/OW9w3wzYaor+O
	 q4RowGyIfg84BkPY4PWrGHU5Q5yq7Rh/RrmgH+KGteAyF7uNxwG3B2FKUpFVLXgrmMZua
	 J8WUg6QMnwDmMsa955kk4fnWOfsdPNdwNgd4MF6aq9pKYp11iZaC9PoJLU+exsIaNw/C/
	 31ipMnd8olBuBEwqNHc1dOW6wD4reqyg1+UezRt3xjcM+7UATPqB1tv9xZ9d6ZKfw1KcY
	 VyAU+fmTxsyHVtaygzaMXFbFvyhZaSiAZIdl8LPd+p3N6c6i7s25SplwWQ/2q1EeW6A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780053275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=aUWS+ulikr9mXU6r3GU0bKgLHNbnuSLeHZpkedcrUM4=;
	b=MQMR+39OgCt1ORTQuw7Z8DkRJUKgVmFTbpX1oQdJSZ5XzSgsUr557RVtLXkPtLXDmfHM
	 Y/C0Z2k/9D74IMBchnkLeIyPeXfWlErRngwWfwH4Z+lQOWCp04zT+HOFgIuaPDe/yJeE4
	 wcvMfTJd2ksw/Sn4QgcaCQ05iuTT/4u1s+SuJLoam7vlsIglT+Uyw3YYj7pkjWKfKgDvG
	 CTmKlxJRIpIi3aJ3D7tKKN/rJ3eiY6aZZdNAchan8+yrC/WP5FTz+MgmVQwpqslhE9V/O
	 5WzAjhSLcIR12llYQ7vBMLX7u+UE6REB6VeAyiELtQhDJVFBFCz7N+f0wYCY77fejqg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="ZM/1Ue5L";
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E509E1F00899
	for <soc@kernel.org>; Fri, 29 May 2026 11:14:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZM/1Ue5L
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E509E1F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aa2691db86so14649076e87.3
        for <soc@kernel.org>; Fri, 29 May 2026 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780053273; x=1780658073; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUWS+ulikr9mXU6r3GU0bKgLHNbnuSLeHZpkedcrUM4=;
        b=ZM/1Ue5Lnxu5dnZOIiwjYB7TDqP7CFRag/F3+6Z+JZwGYSt2+x/s1JkFxOJTH6BZmb
         hukzZY4a5/S8HjOvLtsi4BIeKHOiBhlFA44j6x0y7RTkyyj6ItHBmKo3ByMvkjkdGCyC
         EK8yGaB+Ee0/Hw03RryeuL42b1nLbhq8nNw6Knol0OOFc6cHliADZKBtmxxLhiihdWTp
         JT97JFBC2f1oobeUwrwC6juIOivCt5pSXnEQDi6uMQZ94UUMut/uREfAb7AJgwPuCq7P
         qqhqr1LRe9i7Gw+Zjkjwt2WgGz34s0mnrSLXGNPhPFeEyLwz/ONFoZNqcuvxwItwyrub
         WN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053273; x=1780658073;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUWS+ulikr9mXU6r3GU0bKgLHNbnuSLeHZpkedcrUM4=;
        b=D5Ho39El9FTtQahNNug2lNpUmsnCPwGwo09Q4daBCrjwVBBMfWde/1Gwu+D//ArCTW
         K0InDdmx6haDPyOAcSsPtQ1MaCF3r2zlBR8vh1INkhy6uJZi9hYKRjJLuDbuREi0oJGF
         vUsTr0/7jlTenIIy7+APszhFzL/YR62xr+t3ckCyQMgF0NGyXnZRPTqG32Lykrv/dyJf
         k4VLnnFjYYTcopjDrVbdQbwg8efSG2WJ715+orf/qhjuDfFSDgCY7qWLeIRgKs/cpJwh
         1AOU+gAnKGTmk54xUElIpmwVCXfuhuEVUd72KG1v/PVW8bFrh6zEeeKvlhYQDfj5m5l3
         lQWA==
X-Forwarded-Encrypted: i=1; AFNElJ+UV9FOEtaLYPreC8JDknXW90LhXrRYOLlhXhi5uGzN7nGS/WOqYmSMr4rr90lSmWieWGE=@kernel.org
X-Gm-Message-State: AOJu0Yyw88HlbRO7mt7sAsNBkiWoVlNvx7zONDnLpZygCIHIYcFJAqa4
	ZSSbLZExVbmvTqG7CrxXrxBIe5NGvORVcgBZPziEZZLcL5w98Lv5LMg1jYZ57m6ZUOE=
X-Gm-Gg: Acq92OEAHZTM9rNPb/n2L5lCHgffGISEd2bMQ+p59/kpAqLhIXZ6KZfJwk0N001sHbA
	q1KBnWuko69ciDT5bJWKp0lyr5Nz+1eC63xgIS/nh6KrJlibmi4avmAZvmdKnnmc+5bx31pDxMA
	o4Me1hDoPvlKZPMz+ZbHDy5lCxzi2x3H0rWD3Nv+eytDd+sbxsHBgEVaPmlzWdFEX58lmB8w4b2
	n5C3LbE1JnzKZi0b73t9DuIxANtOoBumkWb9nYLY1LRT4tNd3MGzjQtHQFraeJvp9HTF+1N58Ks
	FqxB6mfl9nrAI9CgGNbUDIS5KTCGqvNKj5pA1WZorDa2Z6Wnv+o0v52domS8S0hVHq92Xxq7pch
	Go2Rp3g1j+QMp+BPkJCdpcrH8iPUI9mNTBInyWqqA8na1Uj3zKPI1r/SzR++LT5fRGcp0FIxnuF
	lon2aBAJKiMJqmJ38bv596huVTC/ZklXMAG/RT03zbnD5qpLkjDY4KEpb2xA0LxT/lbDIXl6YVX
	CkhHDJEk1VRnG6LukoXVuePn1mK+Kk=
X-Received: by 2002:a05:6512:a8b:b0:5a8:94c2:d49a with SMTP id 2adb3069b0e04-5aa59492581mr730998e87.27.1780053273106;
        Fri, 29 May 2026 04:14:33 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b068bd4sm221122e87.15.2026.05.29.04.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:14:32 -0700 (PDT)
Date: Fri, 29 May 2026 13:14:30 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE for v7.2
Message-ID: <20260529111430.GB2532355@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull these two patches for the OP-TEE driver.

Thanks,
Jens

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-for-v7.2

for you to fetch changes up to 3faa6774ffc5973af39ac9c4f1fe93aa92ec9407:

  tee: optee: fix kernel-doc warnings (2026-04-27 14:13:14 +0200)

----------------------------------------------------------------
OP-TEE updates for 7.2

- Fix kernel-doc warnings in optee_private.h and optee_msg.h
- Allow MT_NORMAL_TAGGED shared memory to support ARM64 MTE buffers

----------------------------------------------------------------
Hirokazu Honda (1):
      tee: optee: Allow MT_NORMAL_TAGGED shared memory

Rodrigo Zaiden (1):
      tee: optee: fix kernel-doc warnings

 drivers/tee/optee/call.c          |   3 +-
 drivers/tee/optee/optee_msg.h     |  50 +++++++++-------
 drivers/tee/optee/optee_private.h | 120 ++++++++++++++++++++------------------
 3 files changed, 94 insertions(+), 79 deletions(-)
