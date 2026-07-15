Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF430675C
	for <soc@lists.linux.dev>; Wed, 15 Jul 2026 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115587; cv=none; b=i2hsUxP7pjy+VdH93zq8KarVA7JSkwPBTsGbPGxhnaPJIPG48oer5SAPGNNSCbOeaNPjcKZbkxQhcWf5gBNd3kXfBO3fWh8WqWCNOu9P8OS6BAUSqN6Ythc69gVGEOFMC5rHvxrgvUt+g3qHIL56jsDVk4m/YDmKuoqVQm9GiGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115587; c=relaxed/simple;
	bh=lnjkdTJTwtRH/C7ThPHAmOEOL55oX+hMszv4tacb2SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTIlS+Pw2rjHcv+usatVxQ+aKiwi5QrVRIwqFSDAG7nxILrz1GvOyc5T0Dadp3o/5r0Y1GSrpR5O2BBOtsBM/w5fVhGdYwtt3ZMq7GxZFkuaBKjbne3vWB4idPb3UKbIOA3ltBBGh9BNuOunXjGIyc2mDu+eXZG9wZjnXFDypJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0OLiaGL/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0OLiaGL/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D0BD1A0FFC;
	Wed, 15 Jul 2026 11:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C42BC6035C;
	Wed, 15 Jul 2026 11:39:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEDD711BD22AD;
	Wed, 15 Jul 2026 13:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784115582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=lPsy/55HzbP7oOFeS2o/TT2hWMyjeQtCOJUveb6kuEA=;
	b=0OLiaGL/z8I67XYz79/ZDTZNHClzirXde2miOkggH4EYIeto1iUTE6BFBdlOPg3+5+ZU03
	6qO07o+9EMAdJmWj2yB6TkWFSGFj8MVrIF8JZn5kcTjbQF9AkDBgi7Pm8yNPt73HvupXVg
	CEcwADte451q1rMVOCCwCHNownYHKuLYJJ9OV7tOK4eHhaMsJxI7v7QfUFe6ypYL4NGw3P
	+22avDbk6QVIiZH6bkVkM8gvqoeejXM/qTDxOl1BSJZ9lKnK3ZybSuR2Srpj3EjMe01YJu
	t7TssZnSqv0Dhx09lI3zyyfOFyUfzVwDMkYcQ+3iOYCvjLgYLUOOt8TcD3ENAA==
Date: Wed, 15 Jul 2026 13:39:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the arm-soc tree
Message-ID: <202607151139419b82ddbf@mail.local>
References: <alUh--gXbJNcbmuV@sirena.org.uk>
 <eeef7a7e-22a6-4b88-b23c-cade1b62edb2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeef7a7e-22a6-4b88-b23c-cade1b62edb2@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

On 13/07/2026 18:38:17+0100, Mark Brown wrote:
> On Mon, Jul 13, 2026 at 06:35:55PM +0100, Mark Brown wrote:
> > Commits
> > 
> >   923588dd861ba ("ARM: mark mv78xx0 support as deprecated")
> 
> > are missing a Signed-off-by from their committers
> 
> Alexandre, you did a rebase which makes you the committer of all the
> commits you rebased - you need to add a signoff (git rebase --signoff
> might help).

Yeah, let me fix my mess.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
