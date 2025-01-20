Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785C01E3793
	for <soc@lists.linux.dev>; Mon, 20 Jan 2025 14:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737383439; cv=none; b=XR0aHxv+885OigxFL0JUpsboPEAu7Wi61yahc15Tl+3iqGWkznCfnnFIpe4Mj70WuOvd0ua4KWu/+GoXssybXaTQqzMa2JmFWO7YdbG1034vo1xFXgGEaHGs6YJnO6K31RWr2Dbdd3XWZDjmUIsr/C2c+wr+k8XzXzDrpDwQ5gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737383439; c=relaxed/simple;
	bh=LG7cL6jbSLDpfMP1zDlLO/D7SYb4JLs2hkcdS+/3MCI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Gdlb1g/2vK02z0HY2olDWABi3erRgPwRggpuFYkFyCGbB8/ZmTesWVzqsQNCEHPoGr6fuEL7HHrwEaD/IBYrZz2gCt0c9/dffY45V2zkOF7LJ0656QNyllHHf6N4TaecHxZsIoUmJp5UtxkhiCa8+lBO//+HQ1kPsIOZaL+z3Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TItvN9xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TItvN9xm"
Received: by smtp.kernel.org (Postfix)
	id E71A0C4CEE6; Mon, 20 Jan 2025 14:30:38 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8EBAC4CEDD
	for <soc@kernel.org>; Mon, 20 Jan 2025 14:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8EBAC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d88cb85987so40067246d6.1
        for <soc@kernel.org>; Mon, 20 Jan 2025 06:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737383437; x=1737988237; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9pWfp55lH1qLtBZ65O7o5R+HV7RURkAKafgFK2fG/Sw=;
        b=TItvN9xmwci8g8wA2ccxdUQhm9XjMIICKFDdFNLWT0S009+v2/06DpLM3l7WTwtQz/
         lFivf8ZSksil4WPPTbTswGuSE9yGFLvo5PFd0rSHkcyHTh5yqf96jDmenDg/P/sYtgMj
         PwPF5HvSSOTUT5+ThCKY0Q5Ig2KTPcqxfStnOzIK8asrM/YeP1tgNgxbMeRpdonGMzfv
         08O0ePWWSUwPfBJgmhPCQUvREunTAfk8bOE2z/MhH4ILHWLZJKFgAOAcJbkae7Qmv6cV
         MqWxRgR2fAdb2G65vFVrMWa38UgTxfu3u0NF/Tlpfl+tYt5EZOaQxRtvH//XGv7YjVBg
         Gnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737383437; x=1737988237;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pWfp55lH1qLtBZ65O7o5R+HV7RURkAKafgFK2fG/Sw=;
        b=oYbBHBBY3srKN6IUDH+Kd0z9uTP2xnivS3uQ1v/xv+FQ+6uDvOJ5Q5hTIk2qDoiZSV
         Xhb4Vuk1l5BVLaR61qP/k0W0U+/p0wC2JgOCBZFCS1nsWxVSkZB9HANSIS9X78eKl8do
         B7AgkD8VYLNuaS0ArYaWKcECslkPty5Psa31guzKLieJFsDsNgijCJ8dhnT6L/6ihjEj
         YY98j5Q+MbVBX1eAnJVDadfuMGLUUVPQf66s7zXR6EAluzpQDqWkkQpgLO1vRTkHilVh
         6SfNv3gxetp7D4T4bJ4StxtMVCOwsN4Goj6m7Owr6Y+exWcVxXlmujCa9RUPzn+2aSYL
         2L4A==
X-Forwarded-Encrypted: i=1; AJvYcCWrAnyWlK8YceNnv9hBA7nvQOQCRvnnuvPH6h5JHLiV6FW7TlyUVbVQENgyST7eLhSfuf8=@kernel.org
X-Gm-Message-State: AOJu0YwGEpp5AdZkbqB6WMRP9IbqnGUnmAuRh3wQp9c3ux2Vby8xtaYl
	3UA5zDL1MuAQ5dPjkO2szSmepZq/UX7DzEWjjuCGWGTy1+eJeQk6
X-Gm-Gg: ASbGncvsLYU0gq2wWpZVdMo7GGxbONKqmflEyVclTxvFJirGIQKHkxp6UHJuZYfVYzm
	BJz5+YUidvUOg4N51ZidkFZGs4dWb8Q6kd0RgoJzktAvqhxMQYKVgjMO30XafZl5IFbJDGeqYul
	/R4eHpv077VKcvHNJ3JrIl4ZooPdg1tqznd8fD4jTow/vtEUzgpiIdJM6N7Sewyk/9B3rbboN0s
	BBGNtL4hdVBXqM5q6veVC1L0nziv1UlmmrRxseuO1Cc4J5Cv/3BoAfVUwzdfS1aKeU/JbiUCdAk
	WryaANMsQTCYyXlefOgA1hwmHGxgIMobw01f4Upr6EaV
X-Google-Smtp-Source: AGHT+IFUmQY5Dr2olOfpMBuAROfY6A+tZRZItF1tq65sFXbzH4wu8wSJY2lrVMzQVROwIxZI0McXtA==
X-Received: by 2002:a05:6214:4344:b0:6d9:2f70:2dab with SMTP id 6a1803df08f44-6e192c3be29mr343340116d6.16.1737383436745;
        Mon, 20 Jan 2025 06:30:36 -0800 (PST)
Received: from errol.ini.cmu.edu (pool-108-39-141-40.pitbpa.fios.verizon.net. [108.39.141.40])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afbf38a9sm42012186d6.22.2025.01.20.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 06:30:36 -0800 (PST)
Date: Mon, 20 Jan 2025 09:30:34 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Davis <afd@ti.com>
Subject: Re: [GIT PULL] LiteX updates for next
Message-ID: <Z45eCnu8QwJrO_Ry@errol.ini.cmu.edu>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z41PgCffqPUTyxkE@errol.ini.cmu.edu>
X-Clacks-Overhead: GNU Terry Pratchett

Hi Arnd,

Sorry for the n00b question, but I just saw that 6.13 came out right
after I sent you this PR :)

What's the right thing to do in this situation? Wait for 6.14-rc1 and
try again? Something else ?

Thanks, as always,
--Gabriel

On Sun, Jan 19, 2025 at 02:16:16PM -0500, Gabriel L. Somlo wrote:
> Hi Arnd,
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/litex-hub/linux.git tags/litex-6.13-rc1
> 
> for you to fetch changes up to c7345869aa382b1e22691d51cbbd218d7f488a55:
> 
>   drivers/soc/litex: Use devm_register_restart_handler() (2025-01-19 14:05:35 -0500)
> 
> ----------------------------------------------------------------
> LiteX updates for next
> 
> Remaining LiteX updates from 2024, reviewed and
> successfully tested against v6.13-rc1.
> 
> Signed-off-by: Gabriel Somlo <gsomlo@gmail.com>
> 
> ----------------------------------------------------------------
> Andrew Davis (1):
>       drivers/soc/litex: Use devm_register_restart_handler()
> 
>  drivers/soc/litex/litex_soc_ctrl.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
