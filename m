Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D7327F4DF
	for <soc@lists.linux.dev>; Tue,  4 Mar 2025 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102119; cv=none; b=oBdwTetufbuKt5Q3s1/FUDCFI9Adc9XdA5ir/uNqUJZg6P4y/NTrw1OJncJF3TXItp62qKSle21+FHOY6Y/+nZPMRIaRaIfUKbEJTu3tOHAQMuWPiPb9SGrBHBh3+/adfEqSrAt1h77rJRx90SPe/Xf61+5ILgOIQFENa4Hyx1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102119; c=relaxed/simple;
	bh=xc4FEz4bXKZ8lIctaMZAYMrMWNeamvFBp6wijgRXR3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OF3c82cgplUn9kkJ0eja/FaJYWK/dsn2WdFAdf2A7AlQ/0ieaNHCBCZa4XShQJKgVmSuUQmAYQ9RIyuByuvdE5RbpGSnP6ij0j4skADz6IzE50iYR7JkaU9sJhU0RMEvsgoL5yQtfzotUbr85v60uVxY3u/e0G3r2LjtrvxAbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D2A72B;
	Tue,  4 Mar 2025 07:28:50 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 399773F66E;
	Tue,  4 Mar 2025 07:28:35 -0800 (PST)
Date: Tue, 4 Mar 2025 15:28:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, soc@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Luke Parkin <luke.parkin@arm.com>, Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: use ioread64() instead of
 ioread64_hi_lo()
Message-ID: <Z8ccIBTgn6n7CYXh@bogus>
References: <20250304144346.1025658-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304144346.1025658-1-arnd@kernel.org>

Hi Arnd,

On Tue, Mar 04, 2025 at 03:43:34PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The scmi_common_fastchannel_db_ring() function calls either ioread64()
> or ioread64_hi_lo() depending on whether it is compiler for 32-bit
> or 64-bit architectures.
> 
> The same logic is used to define ioread64() itself in the
> linux/io-64-nonatomic-hi-lo.h header file, so the special case
> is not really needed.
> 
> The behavior here should not change at all.

LGTM. I just sent PR for v6.15 this morning. Either I can redo PR with
this included or you can just apply this directly. I am fine either way.
If you go for the latter approach,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

If you prefer me to send updated PR, let me know. I don't want to create
confusion by recalling by PR and sending an updated one without consulting
you.

--
Regards,
Sudeep
