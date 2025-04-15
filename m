Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856422C35E
	for <soc@lists.linux.dev>; Tue, 15 Apr 2025 18:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742379; cv=none; b=oLGDfMbG5JSwLkO60tAVQTXubj/X/iwG7+9P/BlROnnvl1/v47r1f6gHQSAqF0FKHGzCrqGvyHmqMosWOft+hzzel2qoXkve2H9ryswduOpy6V1RuhmFOSXEegXlZ3IloA6qwOoB/W3ghh5/ggc0QnYddAxACc8IBBLbdMBT3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742379; c=relaxed/simple;
	bh=/QYShN7IRJ3g7iXE3mqIafeBXdL5DRR76aNqimwoUxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJRP1JUMg71neYXtm8fv8XMGGs3Vm6/mZ9lXmmiOF57P6cnIEPYeO7dTuJPH/TGOImnSsMfj6WBNH/upZoi91klpI4pwT5xPJtoV94PHuPWN8Qs6kxIaZwb/Wb1BVMiQdKP0XQf1ocAdr7l0XeG+DtNt5cNOao/QCY2Fst7wdIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 2E500C4AF09; Tue, 15 Apr 2025 18:39:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id A5103C4CEE9;
	Tue, 15 Apr 2025 18:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5103C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6CE51756;
	Tue, 15 Apr 2025 11:39:34 -0700 (PDT)
Received: from bogus (unknown [10.163.48.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23D2A3F694;
	Tue, 15 Apr 2025 11:39:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:39:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v6 06/10] mailbox: add CIX mailbox driver
Message-ID: <20250415-beryl-malamute-of-kindness-7fba06@sudeepholla>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-7-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072724.3565533-7-peter.chen@cixtech.com>

On Tue, Apr 15, 2025 at 03:27:20PM +0800, Peter Chen wrote:
> From: Guomin Chen <Guomin.Chen@cixtech.com>
> 
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.
> 

Do you have a specification for this mailbox ?
I see lot of resemblance with Arm MHUv3. Is this a variant of it ?
I just don't want to see a separate driver for a small tweak of MHU v3 IP
itself.

-- 
Regards,
Sudeep
