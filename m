Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9453578F33
	for <soc@lists.linux.dev>; Tue, 10 Dec 2024 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733825625; cv=none; b=B5kivbGGWQ3tjZ9Tyz1dFAkw0rT40Wav8MOoC7bhGfCBXykiqd3bS4kZGrbuf2CHJzilcEc+CaAoFjDBkHQE2fEuxyUgVWYXt74pY3sT3/XDzuYcqZA4logFkaIF16AiccqtFfBLNQcWZ8qp5Rkhj/MrOBafEQO7bRlz1bkwIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733825625; c=relaxed/simple;
	bh=VoX3zzdILzbd51cMBSujGWg/JF4rCkooPvcXu95ULHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxsCE+nPu8ZnANiIUaPeo7Ae8l2rNIJKllv/uWkbrJ18lKixQkGRHSW7PqyEZV/zPJ0cTR+u+3oxOIsmC5xABG4uRjBjWfKhwIe5AkAaok6dEAxN0T+hg7LDJq0SFckqixMJ2RlYhVdBMCysldk9in1EBSx3ChlH5yjJ1atU+V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 489C3C4CEDD; Tue, 10 Dec 2024 10:13:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id 37627C4CED6;
	Tue, 10 Dec 2024 10:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37627C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8F6D113E;
	Tue, 10 Dec 2024 02:14:10 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF8A73F58B;
	Tue, 10 Dec 2024 02:13:41 -0800 (PST)
Date: Tue, 10 Dec 2024 10:13:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v6.13
Message-ID: <Z1gUUz-I3HCQ7rNV@bogus>
References: <20241205114406.708710-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114406.708710-1-sudeep.holla@arm.com>

On Thu, Dec 05, 2024 at 11:44:06AM +0000, Sudeep Holla wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 

Ignore this one, update v2 sent [1].

-- 
Regards,
Sudeep

[1] https://lore.kernel.org/all/20241210101113.3232602-1-sudeep.holla@arm.com/
